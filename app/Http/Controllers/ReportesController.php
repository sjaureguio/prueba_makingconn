<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ReportesController extends Controller
{
    public function records()
    {
        $records = DB::select("
            SELECT
                cli.nombreComercial Cliente,
                c.titulo Campania,
                plan_m.nombre PlanMedio,
                p.nombres NombrePeriodista,
                p.apellidos ApellidosPeriodista,
                m.nombre Medio,
                prog.nombre NombrePrograma,
                plat.descripcion PlataformaDescripcion,
                platc.descripcion PlataformaClasificacion
            FROM
                detalle_plan_medios depm
            INNER JOIN
                plan_medios plan_m on depm.idPlanMedio = plan_m.id
            INNER JOIN
                campaigns c on plan_m.campaign_id = c.id
            INNER JOIN
                clientes cli on c.cliente_id = cli.id
            INNER JOIN
                programa_contactos pc on depm.idProgramaContacto = pc.id
            INNER JOIN
                personas p on pc.idContacto = p.id
            INNER JOIN
                programas prog on pc.programa_id = prog.id
            INNER JOIN
                medios m on prog.medio_id = m.id
            INNER JOIN
                medio_plataformas mp on m.id = mp.medio_id
            INNER JOIN
                plataforma_clasificacions platc on mp.idPlataformaClasificacion = platc.id
            INNER JOIN
                plataformas plat on platc.plataforma_id = plat.id
            ORDER BY 
                cli.nombreComercial;
		");

        return response()->json([
            'success' => true,
            'message' => 'OK',
			'data' => $records,
		], 201);
    }
}
