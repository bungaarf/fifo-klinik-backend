<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\JsonResponse;

class Handler extends ExceptionHandler
{
    protected $dontReport = [];

    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    

    protected function invalidJson($request, ValidationException $exception): JsonResponse
    {
        return response()->json([
            'message' => 'Validasi gagal.',
            'errors' => $exception->errors(),
        ], $exception->status);
    }
}
