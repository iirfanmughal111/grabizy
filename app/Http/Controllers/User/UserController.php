<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Config;
use App\Models\Profile;
use Illuminate\Support\Facades\Auth;
use App\Notifications\userAdminNotifcation;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Hash;

use File;
use  App\Models\Order;
use  App\Models\WishList;
use  App\Models\Bidding;
use  App\Models\Status;
use  App\Models\Message;
use  App\Models\User;
use  App\Models\Setting;




class UserController extends Controller
{

    protected $per_page;

    public function __construct()
    {
        $this->user_path = public_path('/uploads/user');
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
    

    }

    public function dashboard(Request $request){
        return redirect('dashboard/profile');
        return view('frontend.common.dashboard');
    }
    public function profile(Request $request){
       
        if (url()->previous() == url('shop/cart')){
            $request->session()->put('redirect_url','shop/cart/check-out');
        }
        
        return view('frontend.user.profile');

    }

    public function profileStore(Request $request){
        
        $user = Auth::user();
            $msg = 'something went wrong';
                $id =Auth::user()->id;
                $profile = [];
                if  ($user->hasRole('admin') || $user->hasRole('staff')){
                    $profile['user_id'] = $request->user_id;
                }
                else{
                    $profile['user_id'] = Auth::user()->id;
                }
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

              
                if ($request->profile_id=='null'){
                $prof = Profile::create($profile);
                $msg = 'Profile  Added successfully';
                }
                else {
                $prof = Profile::whereId($request->profile_id)->first();
                if ($prof){
                    $prof->update($profile);
                    $msg = 'Profile updated successfully.';

                }
                else{
                    $msg = 'Profile record not found'.$request->prodId;
                }

                }
                if ($request->session()->has('redirect_url')){
                    $redirect = $request->session()->get('redirect_url');
                    $request->session()->forget('redirect_url');
                    return redirect($redirect);

                }

                return redirect()->back()->with('status',$msg);
    }

    public function orders(Request $request){
        if (Auth::check()){
            $filter = 'undefined';
            $query = Order::where('user_id',Auth::user()->id);
            if ($request->status && $request->status!= ''){
                $query->where('status_id',$request->status);
            $filter = $request->status;

            }
        $orders = $query->orderBy('order_no','desc')->paginate($this->per_page);
        $orderStaus = Status::where('is_active',1)->get();
        return view('frontend.user.orders',compact('orders','orderStaus','filter'));
    }
    return redirect ('/login');

    }

    public function listWishList(Request $request){
        if (Auth::check()){
        $wishlist = WishList::where('user_id',Auth::user()->id)->orderBy('created_at','desc')->paginate($this->per_page);
     
        return view('frontend.wishlist.wishlist',compact('wishlist'));
    }
        return redirect ('/login');

    }

    public function biddingsList(Request $request){
        if (Auth::check()){
            $biddings = Bidding::where('user_id',Auth::user()->id)->orderBy('created_at','desc')->paginate($this->per_page);
  
        return view('frontend.bidding.bidding',compact('biddings'));
    }
        return redirect ('/login');

    }

    public function about(Request $request){
        $settings = Setting::first();
        if ($settings){
            session()->put('site_logo', $settings->site_logo);
        }
        return view('frontend.about.about',compact('settings'));
    }
    public function contact(Request $request){
        $settings = Setting::first();
        if ($settings){
            session()->put('site_logo', $settings->site_logo);
        }
        return view('frontend.contact.contact',compact('settings'));
    }
    public function contactStore(Request $request){

        $validation = [
            'name' => ['required', 'string', 'max:255'],
            'email' => 'required|regex:/(.+)@(.+)\.(.+)/i',
            'subject' => 'required|string|max:255',
            'message' => 'required|string|max:1000',
        ];

        $request->validate($validation);
        $newMessage = [];
        $newMessage['name'] = trim($request->name);
        $newMessage['email'] = trim($request->email);
        $newMessage['subject'] = trim($request->subject);
        $newMessage['message'] = trim($request->message);
        if (Auth::check()){
            $newMessage['user_id'] = Auth::user()->id;
            $newMessage['email'] = Auth::user()->email;
            $newMessage['name'] = Auth::user()->name;
        }
       $msg = Message::create($newMessage);
        if ($msg){
            $this->notices($request,$newMessage);
            
        }
        return redirect()->back()->with('status', 'Thanks for contacting us. We will contact you soon.');

    }
   

    protected function notices($request,$data){
        
        $admins = User::role('admin')->get();
        $staffs = User::role('staff')->get();
        $user = null;
        if (Auth::check()){
            $user = Auth::user();
        }else{
            $user = User::where('email',$request->email)->first();
            if (!$user){
                $user = $admins[0]; //user not registered, just to keep data simillar
            }
        }
     

        $sycn_id = time();
        foreach($admins as $admin){
            $admin->notify(new userAdminNotifcation($user,'4','Message from '.$data['name']));
            $userNofitication=$admin->notifications()->orderBy('created_at','desc')->get()->first();
            $userNofitication->sync_id=$sycn_id;
            $userNofitication->save();
        }
        foreach($staffs as $staff){
            $staff->notify(new userAdminNotifcation($user,'4','Message from '.$data['name']));
            $userNofitication=$staff->notifications()->orderBy('created_at','desc')->get()->first();
            $userNofitication->sync_id=$sycn_id;
            $userNofitication->save();
            }
    }

    public function changePassword(Request $request){
        if (Auth::check()){
            if ($request->isMethod('get')){
                return view('frontend.user.changePassword');
            }else if ($request->isMethod('post')){
                $validation = [
                    'old_password' => ['required', 'max:255'],
                    'new_password' =>  ['required', Rules\Password::defaults()],
                    'confirm_password' => ['required', Rules\Password::defaults()],
                ];
                $request->validate($validation);
                
                if (!(Hash::check($request->old_password, Auth::user()->password))){
                    return  redirect()->back()->with('status','Old password not matched.');;
                }
                if ($request->new_password!=$request->confirm_password){
                    return  redirect()->back()->with('status','New and confirm Password does not matched.');;
                }
                if (Hash::check($request->new_password, Auth::user()->password)){
                    return  redirect()->back()->with('status','You can not use your old password.');;
                }
                User::whereId(Auth::user()->id)->update(['password'=> encrypt($request->new_password)]);
                return  redirect()->back()->with('status','Password updated successfully.');;


            }

        }

    }

    public function privacyPolicy(){
        $settings = Setting::first();
        return view('frontend.privacy_policy.privacy_policy',compact('settings'));
        
    }
}
