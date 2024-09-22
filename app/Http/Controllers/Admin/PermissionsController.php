<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Spatie\Permission\Models\Role;
use  App\Models\User;
use Illuminate\Support\Facades\Auth;

use Spatie\Permission\Models\Permission;

class PermissionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        check_permission_access('listing permissions');   


      //  $role = Role::create(['name' => 'user']);
    //    Permission::create(['name' => 'add users']);
    //    Permission::create(['name' => 'edit users']);
        // Permission::create(['name' => 'delete users']);
        // Permission::create(['name' => 'listing users']);

        // $role1 = Role::where(['name' => 'admin'])->first();
   //     var_dump($role1->hasPermissionTo('edit product'));

        // $role1->givePermissionTo('add users');
        // $role1->givePermissionTo('edit users');
        // $role1->givePermissionTo('delete users');
        // $role1->givePermissionTo('listing users');
        // $user = User::where(['name' => 'admin'])->first();
    //    var_dump($user->getRoleNames());exit;
      $roles = Role::get();
    //   $admin = $roles[0];
    //   $staff = $roles[1];
    //   $user = $roles[2];

   //   dd($roles[2]);
    $permissions = Permission::get();
        // $user->assignRole($role1);
       
    //dd($permissions);
        return view('admin/permissions/permissions',compact('permissions','roles'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        dd('disabled');
    }

    public function perm_enalble_disable(Request $request)
	{

        check_permission_access('edit permissions');   

	
		if($request->ajax()){
            $data = [];
            $data['success'] = false;

            if ($request->role!='staff'){
				$data['msg'] = 'Something went wrong while  fetching role information';
            }
            else{
			
			$role = Role::where('name','staff')->first();
			if ($role){
                $permName = $request->perm;
				$status = $request->status;
                if ($request->status == 'allow'){
                    if (!$role->hasPermissionTo($permName)){
                        $role->givePermissionTo($permName);
                    }
                    $data['msg'] = 'Role permissions upgraded successfully';
                    $data['success'] = true;

                }
                else if($request->status == 'ban'){
                    if ($role->hasPermissionTo($permName)){
                        $role->revokePermissionTo($permName);
                    }
                    $data['msg'] = 'Role permissions revoked successfully';
                    $data['success'] = true;
                }
					
                else{
                    $data['msg'] = 'Error while modifying permissions';
                    $data['success'] = true;
                }
        }
			else{
				$data['success'] = false;
				$data['msg'] = 'Something went wrong';
			}
		  
		   return $data;
		}
    }
		else{

			return 'invalid request';
		}
    }

}
