<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Setting;
use App\Models\Wishbox;
use App\Models\Chat;


use DB;
class AuthenticatedSessionController extends Controller
{

    public function __construct()
    {
        $this->wishbox_path = public_path('/uploads/wishbox');
    }

    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    { 
        $settings = Setting::first();
        return view('frontend.auth.login',compact('settings'));
       
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {
     
        $request->authenticate();

        $request->session()->regenerate();

        if(Auth::check() && Auth::user()->is_active == 0){ 
            //IF STATUS IS NOT ACTIVE 
            //EVENT FAILED
      
            Auth::logout();
            return redirect('/login')->with('status', 'Your account is deactivated.');
        }
          

        Auth::user()->update(['last_active'=>time(),'last_ip'=>(\Request::ip())]);
        

        if (Auth::check()){
            //Performing operations on login for data cleaning to reduce cron/server load
           
            $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->where('read_at','<',now()->subDays(7)->toDateTimeString())->get();
            foreach($notifications as $notification){
                if ($notification->sync_id != null){
                  DB::table('notifications')->where('sync_id',$notification->sync_id)->where('read_at','<',now()->subDays(7)->toDateTimeString())->delete();
                }
              }
            $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->where('read_at','<',now()->subDays(7)->toDateTimeString())->delete();

        }

        if(Auth::check() && (Auth::user()->hasRole('admin') || Auth::user()->hasRole('staff'))){ 
                    //IF  IS NOT ADMIN|STAFF 
            return redirect('/admin');
        }

        return redirect()->intended(RouteServiceProvider::HOME);
    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request,User $user)
    {
        
        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        if ($request->session()->has('cart_count')) {
            $request->session()->forget('name');
        }
        
        return redirect('/');
    }
}
