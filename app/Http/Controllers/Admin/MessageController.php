<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use  App\Models\User;
use  App\Models\Profile;
use  App\Models\Message;
use Illuminate\Support\Facades\Auth;

use Config;
use DB;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;

class MessageController extends Controller
{
    public function __construct()
    {
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
    }
    public function messages(Request $request)
    {
        readNotificationById($request->notification);
        if (isset($request->msg_ids) && $request->action==1){
	        check_permission_access('delete messages');
            $msg = Message::whereIn('id',$request->msg_ids)->delete();
            if ($msg){
                $success = 'Messages deleted successfully';
            }
            return redirect()->back()->with('status',$success);
        }
            $filters = [];
	    check_permission_access('listing messages');
            if (isset($request->status) && $request->status =='read'){
                $filters['status'] = 'read';
                $query = Message::where('read_at','!=',null);
            }else{
                $filters['status'] = 'un-read';
                $query = Message::where('read_at',null);
            }
           
            if (isset($request->name)){
                $query->where('name', 'LIKE', '%' . $request->name . '%');
                $filters['name'] = $request->name;
            }
            if (isset($request->email)){
                $query->where('email', 'LIKE', '%' . $request->email . '%');
                $filters['email'] = $request->email;

            }
            
            $messages = $query->orderBy('created_at','desc')->paginate($this->per_page);
            return view('admin.message.message',compact('messages','filters'));

    }
    // public function deleteOldMessages($request){
        
    //     $success = 'Something went wrong!!!';
            
    //     return $success;        
    // }
    public function readMessage(Request $request){

		if($request->msg_id){
            check_permission_access('read messages');   
            $data['success'] = false;
            $message = Message::whereId($request->msg_id)->update(['read_at'=>time()]);
            if ($message){
                $data['success'] = true;
            }
                return $data;
        }

    }
   
}
