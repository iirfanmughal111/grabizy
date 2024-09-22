<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use  App\Models\User;
use  App\Models\Profile;
use  App\Models\Category;

use  App\Models\Product;
use  App\Models\Order;

use Stevebauman\Location\Facades\Location;



use App\Http\Model\Notification;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
use DB;
use Config;

class AdminController extends Controller
{
  public function __construct()
  {
    $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
  }
    public function dashboard(){
        check_permission_access('listing dashboard');
        $users = User::orderBy('last_active', 'desc')->limit(10)->get();
        $counts = [];
        $counts['users'] = User::count();
        $counts['categories'] = User::where('is_active',1)->count();
        $counts['orders'] = Order::count();
        $counts['products'] = Product::count();
        return view('admin/dashboard',compact('users','counts')); 
        
  }

    public function userNotifications(){

        $count="";
        $userlist="";
        $returnHTML="";
  
        $currenUserNotifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->whereNull('read_at')->orderBy('created_at','desc')->paginate((5));
     
        if(count($currenUserNotifications)){
          
           $userlist=$this->convertJsonDecode($currenUserNotifications);
           $count=count($currenUserNotifications);
        }
 $returnHTML = view('partials.notify')->with('userlist', $userlist)->render();
        if ($count){      
        
        
      //    $returnHTML.="<div class=' d-flex justify-content-between px-3'>
      //    <a data-title='Show all' class='py-0 px-1 title-popover nav-link deleteAllNotifications'type='button'><i class='fa-solid fa-envelope-open-text'></i></i></a>
      //    <a data-title='clear all' class='py-0 px-1 title-popover nav-link readAllNotifications' type='button'><i class='fa-solid fa-list-check'></i></a>
      //  </div>";
        }

        return (response()->json(['html'=>$returnHTML,'unreadcount'=>$count]));   
      }
  

      public function listNotifications(){
        $user = Auth::user();
        if ($user){
  
          $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->orderBy('created_at','desc')->paginate(15);
            if ($user->hasRole('admin') || $user->hasRole('staff')){
        return view('partials.listNotifications',compact('notifications'));

            }
        return view('partials.userNotification',compact('notifications'));

        }

        return view('admin.partials.error404',compact('notifications'));
          
      }
      public function readNotifications(){
  
        $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->get();
        foreach($notifications as $notification){
          if ($notification->sync_id != null){
            DB::table('notifications')->where('sync_id',$notification->sync_id)->update(['read_at'=>now()]);
          }
        }
        $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->update(['read_at'=>now()]);
     
          return back()->with('status','All notifications marked as read');
          
      }
      public function deleteNotifications(){
        $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->get();

        foreach($notifications as $notification){
          if ($notification->sync_id != null){
            DB::table('notifications')->where('sync_id',$notification->sync_id)->delete();
          }
        }
        $notifications = DB::table('notifications')->where('notifiable_id',Auth::user()->id)->delete();
     
        return redirect('/notifications')->with('status','All existed notifications deleted');
          
      }

      public function convertJsonDecode($currenUserNotifications){
  
        $userlist=array();
  
        foreach ($currenUserNotifications as $key=>$notification) {
           
          array_push($userlist,json_decode($notification->data,true));
          $userlist[$key]['id']=$notification->id;
         
        //  auth()->user()->unreadNotifications->where('id', $notification->id)->markAsRead();
       
        }
  
        
        return $userlist;
  
      }

      public function exitUserNotificationById(Request $request){
        $data['msg'] = 'Something went wrong.';
            $data['success'] = false;
        if ($request->notification_id){
        $userNofitication =  DB::table('notifications')
        ->whereId($request->notification_id)->get();
        $status = false;
        if ($userNofitication){
          if ($userNofitication[0]->sync_id != null){
            $status =DB::table('notifications')
        ->where('sync_id',$userNofitication[0]->sync_id)->delete();   
    }
    else{
      $status = DB::table('notifications')
      ->where('id',$request->notification_id)->delete();  
      }
   
        $data['msg'] = 'Notifications deleted.';
        $data['success'] = true;
        }
        }
        return $data;
      }

      public function readUserNotificationById(Request $request){
        $data['msg'] = 'Something went wrong.';
            $data['success'] = false;
        if ($request->notification_id){
        $userNofitication = DB::table('notifications')
        ->whereId($request->notification_id)->get();
        $update = now();
        $data['msg'] = 'Notification marked as read.';
    

        if ($userNofitication[0]->read_at !=null){
          $update= null;
          $data['msg'] = 'Notification marked as Unread.';
        }

        if ($userNofitication){
            if ($userNofitication[0]->sync_id != null){
                    DB::table('notifications')->where('sync_id',$userNofitication[0]->sync_id)->update(['read_at' => $update]);
            }
            else{
                  DB::table('notifications')->whereId($request->notification_id)->update(['read_at' => $update]);
              }
              $data['success'] = true;
        }
      }
        return $data;
      }


}
