<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use  App\Models\User;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;
use App\Notifications\userAdminNotifcation;
class GoogleController extends Controller
{
    /**

     * Create a new controller instance.

     *

     * @return void

     */

     public function redirectToGoogle()

     {
    
         return Socialite::driver('google')->redirect();
 
     }
 
         
 
     /**
 
      * Create a new controller instance.
 
      *
 
      * @return void
 
      */
 
     public function handleGoogleCallback()
 
     {
 
         try {
 
       
 
             //$user = Socialite::driver('google')->user();
             $user = Socialite::driver('google')->stateless()->user();
            
             $finduser = User::where('google_id', $user->id)->first();
        
             if($finduser){
 
                 Auth::login($finduser);
                 Auth::user()->update(['last_active'=>time(),'last_ip'=>(\Request::ip())]);
                 return redirect()->intended('dashboard');
 
             }else{
                 $existedUser = User::where('email', $user->email)->first();
                 if ($existedUser){
                        $newUser = $existedUser;
                         $updateUser = $existedUser->update([
     
                         'name' => $user->name,
                         
                         'google_id'=> $user->id,
                         
                         'last_active'=>time(),
                         
                         'last_ip'=>(\Request::ip())
     
     
                     ]);
                     
                     
                 }else{
                     
                      $newUser = User::create([
 
                     'name' => $user->name,
                     
                     'is_active' => 1,

                     'email' => $user->email,

                     'google_id'=> $user->id,
                     
                     'last_active'=>time(),
                     
                     'last_ip'=>(\Request::ip()),
 
                     'password' => encrypt('admin123_hafizCenter')
 
                 ]);
                  $newUser->assignRole('user');
                     $admins = User::role('admin')->get();
                     $staffs = User::role('staff')->get();
                        foreach($admins as $admin){
                            $admin->notify(new userAdminNotifcation($newUser,'0','New User '.$user->name. ' has been registered'));
                        }
                        foreach($staffs as $staff){
                            $staff->notify(new userAdminNotifcation($newUser,'0','New User '.$user->name. ' has been registered'));
                        }
                 }

                
 
                 Auth::login($newUser);
                
         
                 return redirect()->intended('dashboard');
 
             }
 
 
         } catch (Exception $e) {
 
             dd($e->getMessage());
 
         }
 
     }
}
