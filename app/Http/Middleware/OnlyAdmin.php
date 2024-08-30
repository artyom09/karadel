<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class OnlyAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!auth()->check() || auth()->user()->role_id != 1) {
           return redirect()->to('/');
        }

        return $next($request);
    }
}
