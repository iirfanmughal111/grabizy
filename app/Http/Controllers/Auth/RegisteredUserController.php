<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use App\Notifications\userAdminNotifcation;
use App\Models\Setting;


class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $settings = Setting::first();
        return view('frontend.auth.register',compact('settings'));
       

    //    return view('authentication.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        event(new Registered($user));
        Auth::login($user);
        
        $user->assignRole('user');
        
        $user->update(['last_active'=>time(),'is_active'=>1,'last_ip'=>(\Request::ip())]);

        $admins = User::role('admin')->get();
        $staffs = User::role('staff')->get();
            foreach($admins as $admin){
                $admin->notify(new userAdminNotifcation($user,'0','New User '.$user->name. ' has been registered'));
            }
            foreach($staffs as $staff){
                $staff->notify(new userAdminNotifcation($user,'0','New User '.$user->name. ' has been registered'));
             }
        return redirect(RouteServiceProvider::HOME);
    }
}
