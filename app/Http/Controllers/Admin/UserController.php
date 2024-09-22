<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use Spatie\Permission\Models\Role;
use  App\Models\User;
use  App\Models\Profile;

use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Http\Request;
use App\Notifications\userAdminNotifcation;
use Stevebauman\Location\Facades\Location;
use Config;
use App\Models\Order;
use App\Models\Bidding;
use App\Models\Cart;

use DB;

use Illuminate\Foundation\Auth\User as Authenticatable;
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function __construct()
    {
       // $this->category_path = public_path('/uploads/users');
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
    }

    public function index(Request $request)
    {
   
        $user = Auth::user();
         
        //          $role = Role::where('name','admin')->first();
        //           $permName = 'delete biddings';
        //          if ($role->hasPermissionTo($permName)){
        //              $role->revokePermissionTo($permName);
        //              Permission::where('name',$permName)->delete();
        //          }
        //  dd('Permission denied ');
        //  Permission::create(['name' => 'delete banner']);
        //   $role1 = Role::where(['name' => 'admin'])->first();
        //   $role1->givePermissionTo('delete banner');

        check_permission_access('listing users'); 
        $filters = [];
        $roleQuery= Role::where('id','!=',0);
        if (!Auth::user()->hasRole('admin')){
            $roleQuery->where('name','!=','admin');
        }
        $roles = $roleQuery->orderBy('created_at','DESC')->get();

        $query = User::where('id','!=',1);
        if (isset($request->name)){
            $query->where('name', 'LIKE', '%' . $request->name . '%');
            $filters['name'] = $request->name;

        }

       if (isset($request->email)){
       $query->where('email', 'LIKE', '%' . $request->email . '%');
       $filters['email'] = $request->email;
  
       }
            $users =  $query->orderBy('created_at','DESC')->paginate($this->per_page);

        return view('admin.user.user',compact('users','roles','filters'));	
  
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        check_permission_access('add users'); 
        check_permission_access('edit users'); 
        if ($request->ajax()){
            $data['success']=false;

        $validation = [
            'Name' => ['required', 'string', 'max:255'],
            'role' => ['required',],
            'userId' => ['required',],
            'email' => ['required', 'string', 'email', 'max:255'],
            
        ];

        if ($request->userId == 'null'){
        $validation['email'] = ['required', 'string', 'email', 'max:255', 'unique:users'];
        $validation['password'] = ['required', Rules\Password::defaults()];

        }

        $request->validate($validation);

        $userDetail = [
            'name' => $request->Name,
            'email' => $request->email,
            ];
        if ($request->userId == 'null'){
            $userDetail['password'] = Hash::make($request->password);
            if ($request->role== 'admin'){
                $userDetail['is_active'] = 1;

            }
        }

                if ($request->userId == 'null'){
                    $data['success']=true;
                    $data['msg']='User created successfully';

                    $user = User::create($userDetail); 
                }
                else{
                    $userDetail['id']= $request->userId;
                    $user = User::whereId($request->userId)->first();
                    if ($user){
                        $user->update($userDetail); 
                        $data['success']=true;
                        $data['msg']='User updated successfully';
                    }
                    else{
                        $data['msg']='Error while updating...';
                    }

                }
                    if ($user){
                        if (!($user->hasRole($request->role))){

                            $otherRoles =$user->getRoleNames();
                            if (!empty($otherRoles)){
                                foreach($otherRoles as $old){
                                    $user->removeRole($old);
                                }
                            }
                            $user->assignRole($request->role);
                            }
                     }
                return $data;
            }
            

        return 'Invalid request';
    }

  

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        check_permission_access('delete users'); 

        if ($request->ajax()){
        $user = User::whereId($request->userId)->first();
        $data['success']=false;

        if ($user){          
                $user->delete();
                $data['success']=true;
                $data['msg']='User deleted successfully';

                }
                else{
                    $data['msg']='Something went wrong while deleting!';                   
                }
                return $data;
            
       
        } else return 'inavalid request type';
       

    }


    public function user_enalble_disable(Request $request)
	{
        check_permission_access('edit users'); 

            if($request->ajax()){
                $data = [];
                $data['success'] = false;
                $userUpdate = [];
                $user = User::whereId($request->user_id)->first();
                if ($user){
                    if ($user->hasRole('admin')){
                        $data['msg'] = '<strong>'.$user->name.'</strong> is a admin and Admins can not be enable/disable.';
                        
                    }else{
                    $userUpdate['is_active'] =  $request->status;
                    $user->update($userUpdate);
                    // Show message on the basis of status 
                    $data['msg'] = 'User updated successfully';
                    $data['success'] = true;
                }
            }
			else{
				$data['msg'] = 'Something went wrong';
			}
		  
		   return $data;
		}
		else{

			return 'invalid request';
		    }
		
	}


	public function user_trash(Request $request){
        check_permission_access('listing users'); 


        $roles= Role::orderBy('created_at','DESC')->get();

        $query = User::where('email','!=','');
        if (isset($request->name)){
            $query->where('name', 'LIKE', '%' . $request->name . '%');

        }

       if (isset($request->email)){
       $query->where('email', 'LIKE', '%' . $request->email . '%');
  
       }

       if ((isset($request->email) || isset($request->name) || isset($request->name))){
            $users =  $query->onlyTrashed()->orderBy('deleted_at','DESC')->paginate($this->per_page);
       }
       else{
         $users = User::onlyTrashed()->orderBy('deleted_at','DESC')->paginate($this->per_page);
       }
       
       $viewParams = ['users'=> $users,'roles'=> $roles];
        return view('admin.user.userTrash',compact('users','roles'));	
	}

    public function user_restore(Request $request){
        check_permission_access('edit users'); 

		if($request->ajax()){
			$data = [];
			$user = User::whereId($request->restoreUserId)->restore();
			if ($user){
				$data =array();

				$data['msg'] = 'User restored successfully';
				$data['success'] = true;
			}
			else{
				$data['success'] = false;
				$data['msg'] = 'Something went wrong!!!';
			}
		
		   return $data;
		}
		else{

			return 'invalid request';
		}
	
}


    public function user_delete_permanent(Request $request) {
		
        check_permission_access('delete users'); 
        

        if ($request->ajax()){
        $userRoles = User::withTrashed()->whereId($request->userId)->first();
        $data['success']=false;
                

        $user = User::whereId($request->userId)->forceDelete();
        if ($user){

                    $allRoles =$userRoles->getRoleNames();
                if (!empty($allRoles)){
                    foreach($allRoles as $role){
                        $userRoles->removeRole($role);
                    }
                }
                //Delete all linked data
                Order::where('user_id',$request->userId)->delete();
               
                Cart::where('user_id',$request->userId)->delete();
                Profile::where('user_id',$request->userId)->delete();
                DB::table('notifications')->where('notifiable_id',$request->userId)->delete();

                $data['success']=true;
                $data['msg']='User deleted successfully';
                }
                else{
                    $data['msg']='Something went wrong while deleting'.$request->userId;
                }
                return $data;
            
       
            } else return 'inavalid request type';
        }


// ------------------------------User -Profile---------------------------------

    public function profile(Request $request){
        check_permission_access('listing users'); 

                $user_edit = User::whereId($request->user_id)->first();
                if ($user_edit){
                   
                readNotificationById($request->notification);

                    return view('admin.user.user_edit', compact('user_edit'));
                }      

    }

    public function profileStore(Request $request){
    
        $user = Auth::user();
        $msg = 'something went wrong';
            $id =Auth::user()->id;
            $profile = [];
            $profile['user_id'] = Auth::user()->id;
            $profile['phone'] = trim($request->phone);
            $profile['comapny'] = trim($request->comapny);
            $profile['country'] = trim($request->country);
            $profile['region'] = trim($request->region);
            $profile['city'] = trim($request->city);
            $profile['zip']  =  trim($request->zip);
            $profile['address_line1'] = trim($request->address_line1);
            $profile['address_line2'] = trim($request->address_line2);

            if (isset($request->profile_image)){
            $image = $request->file('profile_image');
            }else{
                $image = null;
                $profile['profile_image'] = $request->old_image;
            }
                $validation = [
                    'name' => ['required', 'string', 'max:255'],
                    'phone' => ['required', 'string', 'max:255'],
                    'profile_image' => 'image|mimes:jpeg,png,jpg|max:2048',
                    'email' => ['required', 'string', 'max:255'],
                    'country' => ['required', 'string', 'max:255'],
                    'region' => ['required', 'string', 'max:255'],
                    'city' => ['required', 'string', 'max:255'],
                    'address_line1' => ['required', 'string', 'max:255'],
                    'zip' => ['required','integer']
    
                ];
           
            $request->validate($validation);

            if($image){
                $profile['profile_image'] = $id.'_'.rand() . 'profile_image.' . $image->getClientOriginalExtension();
                //CREATE Featued  FOLDER IF NOT 
                if (!is_dir($this->user_path)) {
                    mkdir($this->user_path, 0777);
                }
                $imageResult = $image->move($this->user_path,  $profile['profile_image']);
            }

          
            if ($request->user_id=='null'){
            $prof = Profile::create($profile);
            $msg = 'Profile  Added successfully';
            }
            else {
            $prof = Profile::where('user_id',$request->user_id)->first();
            if ($prof){
                $prof->update($profile);
                $msg = 'Profile updated successfully.';

            }
            else{
                $msg = 'Profile record not found'.$request->prodId;
            }

            }


            return redirect()->back()->with('status',$msg);
}



public function locationbyIp(Request $request){

        
    if ($request->ipAddress != null || $request->ipAddress !=''){
            $loc = Location::get($request->ipAddress);
            $data['success'] = false;
            $data['msg'] = 'Something went wrong with ip address';
            if ($loc && $loc->ip == $request->ipAddress){
                    $data['location'] = $loc;
                    $data['given_ip'] = $request->ipAddress;
                    $data['msg'] = 'Location available';
                    $data['success'] = true;
                }
        }
   return $data; 

}



    }

