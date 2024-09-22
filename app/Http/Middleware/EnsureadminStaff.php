<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;

class EnsureadminStaff
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
  
        if (Auth::check()){
         $user = Auth::user();


        if ( $user->hasRole('admin') || $user->hasRole('staff')) {
             return $next($request);
        }
        else{
        return redirect('/not-found');

        }
    
    }
    else{
        return redirect('/login');

    }
       
    }
}
