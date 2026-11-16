<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckRole
{
    public function handle(Request $request, Closure $next)
    {
        // Jika user belum login
        if (!$request->user()) {
            return redirect('login');
        }

        $userRole = $request->user()->role->nama;
        $intendedRoute = null;

        // Tentukan route sesuai role
        if ($userRole === 'admin') {
            $intendedRoute = 'dashboard';
        } elseif ($userRole === 'user') {
            $intendedRoute = 'tasks.index';
        }

        // Jika user mencoba akses route yang tidak sesuai rolenya
        if ($intendedRoute && !$request->routeIs($intendedRoute)) {
            return redirect()->route($intendedRoute);
        }

        return $next($request);
    }
}
