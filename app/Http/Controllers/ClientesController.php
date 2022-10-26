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
}
