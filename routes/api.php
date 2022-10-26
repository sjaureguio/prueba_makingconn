<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Controladores propios
use App\Http\Controllers\ClientesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::controller(ClientesController::class)->prefix('/v1/clientes')->group(function () {
    Route::get('', 'records');
    Route::get('/{id}', 'record');
    Route::post('', 'store');
    Route::delete('/{id}', 'destroy');
});
