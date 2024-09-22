<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Config;
use App\Models\Wishbox;
use App\Models\Chat;
use Illuminate\Support\Facades\Auth;
use App\Notifications\userAdminNotifcation;
use Session;
class WishboxController extends Controller
{

    public function __construct()
    {
        $this->wishbox_path = public_path('/uploads/wishbox');
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
    }
    public function actionIndex(Request $request){
        check_permission_access('listing wishbox'); 
      
        $type =($request->type && $request->type=='completed') ? 1 : 0;
        $wishs = Wishbox::where('is_complete',$type)->orderBy('created_at','DESC')->get();
        $selected = NULL;
        $active  = $request->active==1 ? 1 : 0;
        if ($request->wish_id) {
            $wish = Wishbox::where('id',$request->wish_id)->first();
            $selected = $wish;
            if (isset($request->complete) && $request->complete==1){
                Wishbox::where('id',$request->wish_id)->update(['is_complete'=>1]);
                return redirect('admin/wishbox?active=1');
            }elseif (isset($request->complete) && $request->complete==0 && $request->complete != null){
                Wishbox::where('id',$request->wish_id)->update(['is_complete'=>0]);
                return redirect('admin/wishbox?active=1&type=completed');
            }
            if (isset($request->notification) && $request->notification != '') {
                readNotificationById($request->notification);
            }
        }else if(isset($request->title) && $request->isMethod('post')){

            $wish = Wishbox::where('wish_title','LIKE', '%' . $request->title . '%')->first();
                $selected = $wish;
                $active = 1;
        }
        else if(isset($wishs[0])){

            $selected = $wishs[0];
        }
       
        return view('admin.wishbox.chatbox', compact('wishs','selected','active','type'));
    }


        public function messageSaveAction(Request $request){
            check_permission_access('reply wishbox'); 

        $newChat['message'] = trim($request->message);
        $newChat['wish_id'] = trim($request->wish_id);
        $newChat['user_from'] = Auth::user()->id;
        $newChat['msg_time'] = time();
        $wish = Wishbox::where('id',$newChat['wish_id'])->first();
        $newChat['user_to'] = $wish ? $wish->user_id : 0;     
     
        if (isset($request->gallery)){
            $lastwish = Wishbox::latest()->first();
            $id = $newChat['wish_id'];
            $newChat['msg_gallery'] = json_encode($this->uploadGalleryImages($request->file('gallery'),$id));
        }
      
        $msg = 'some error occurred while sending request';
        $validation = [
            'message' => ['required', 'string', 'max:300'],
        ];
        
        $request->validate($validation);

        $chat = Chat::create($newChat);
        if ($chat){
            $wish->User->notify(new userAdminNotifcation($wish->User,'7',$wish->User->name.' New Message on  wish# '.$newChat['wish_id']));
            $msg = 'Sent!!!';
        }
        return redirect('admin/wishbox?wish_id='.$newChat['wish_id'].'&active=1')->with('status',$msg);

    }

    public function uploadGalleryImages($gallery,$id){
        $imageSet = [];
        foreach ($gallery as $key=>$file) {
            $time = time();
            //get filename with extension
            $fileName = $id.'_'. $time . '_wishbox_image_'.rand(111,999).'.'.$file->getClientOriginalExtension();
            //CREATE Gallery FOLDER IF NOT 
            if (!is_dir($this->wishbox_path)) {
                mkdir($this->wishbox_path, 0777,true);
            }
            $fileResult = $file->move($this->wishbox_path,  $fileName);
            $imageSet[] = $fileName;

        }
    

        // $this->createGallery($imageSet,$id);
        return $imageSet;
    }
}
