<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\ClienteRequest;
use App\Http\Resources\ClientesCollection;
use App\Http\Resources\ClienteResource;
use Illuminate\Http\Request;
use App\Models\Cliente;

class ClientesController extends Controller
{
    // records Metodo para obtener clientes
    public function records(Request $request)
    {
        $records = Cliente::orderBy('nombreComercial');

        $data = new ClientesCollection($records->paginate(20));

        return response()->json([
            'success' => true,
            'message' => 'OK',
			'data' => $data,
		], 201);
    }

    //Metodo para obtener un cliente
    public function record($id)
    {
        return new ClienteResource(Cliente::findOrFail($id));
    }

    //store Metodo para crear o editar un cliente
    public function store(ClienteRequest $request)
    {
        $id = $request->input('id');
        $cliente = Cliente::firstOrNew(['id' => $id]);
        $cliente->fill($request->all());
        $cliente->save();

        return [
            'success' => true,
            'message' => ($id)
				? 'Cliente editado con éxito'
				: 'Cliente registrado con éxito',
            'id' => $cliente->id
        ];
    }
}
