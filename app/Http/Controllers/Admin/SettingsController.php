<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Config;
use App\Models\Setting;
use App\Models\Banner;
use app\Services\CJService;

class SettingsController extends Controller
{
    protected $logo_path,$banner_path,$per_page;
    public function __construct()
    {
        $this->logo_path = public_path('/images/logo');
        $this->banner_path = public_path('/images/banner');

        $this->per_page = getPerPageProducts();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}

    }

    public function indexAction(){
        check_permission_access('listing settings');  

        $settings = Setting::first();
        if ($settings){
            session()->put('site_logo', $settings->site_logo);
        }
        return view('admin.settings.settings',compact('settings'));	
    }

    public function indexActionSave(Request $request){
        $msg = 'something went wrong';
        check_permission_access('add settings');  
        check_permission_access('edit settings');   
                $newSettings = [];
                $newSettings['site_title'] = trim($request->site_title);
                $newSettings['site_tag_line'] = trim($request->site_tagLine);
                $newSettings['send_mail']  =  ($request->send_mail=='on' ? 1: 0);
                $newSettings['privacy_policy'] = trim($request->privacy_policy);

                $newSettings['about_page'] = trim($request->about_page);
                $newSettings['items_per_page'] = trim($request->items_per_page);
                $newSettings['prod_per_page'] = trim($request->products_per_page);
                $newSettings['meta_desc'] = trim($request->meta_desc);
                $newSettings['login_page'] = trim($request->login_page);
                $newSettings['register_page'] = trim($request->register_page);
                $newSettings['twitter_link'] = trim($request->twitter_link);
                $newSettings['instagram_link'] = trim($request->instagram_link);
                $newSettings['whatsapp_link'] = trim($request->whatsapp_link);
                $newSettings['facebook_link'] = trim($request->facebook_link);
                $newSettings['shop_address'] = trim($request->shop_address);
                $newSettings['shop_email'] = trim($request->shop_email);
                $newSettings['shop_contact'] = trim($request->shop_contact);
          
              
                if (isset($request->site_logo)){
                $image = $request->file('site_logo');
                }else{
                    $image = null;
                    $newSettings['site_logo'] = $request->old_logo;
                }
                    $validation = [
                        'site_title' => ['required', 'string', 'max:255'],
                        'site_logo' => 'image|mimes:jpeg,jpg,png|max:2048',
                        'shop_email' => [ 'email', 'max:255'],
                        'items_per_page' => [ 'integer', 'max:100'],
                        'products_per_page' => [ 'integer', 'max:100'],
                        
                    ];

               
                $request->validate($validation);

                if($image){
                    $newSettings['site_logo'] = time() . '_site_logo.' . $image->getClientOriginalExtension();
                 
                    if (!is_dir($this->logo_path)) {
                        mkdir($this->logo_path, 0777,true);
                    }
                    $imageResult = $image->move($this->logo_path,  $newSettings['site_logo']);
                    session()->forget('site_logo'); 
                    if (file_exists($this->logo_path.'/'.$request->old_logo)){
                        unlink($this->logo_path.'/'.$request->old_logo);
                    }               
                }
                $settings = Setting::first();
                if ($settings){
                    $settings->update($newSettings);
                   
                    
                    $msg = 'Settings updated successfully.';
                    session()->forget('site_title');
                    session()->forget('meta_description');
                    session()->forget('twitter_link');
                    session()->forget('instagram_link');
                    session()->forget('facebook_link');
                    session()->forget('whatsapp_link');
                    session()->forget('storeAddress');
                    session()->forget('shop_email');
                    session()->forget('shop_contact');
                    session()->forget('items_per_page');
                    session()->forget('prod_per_page');
                }
                else {         
                    $settings = Setting::create($newSettings);
                    $msg = 'Settings  Added successfully.';
                }

                return redirect('admin/settings')->with('status',$msg);

        
    }
    
    
    public function bannerAction(){
        $cj = new CJService();
        $cj->createCategories();
        check_permission_access('listing banner'); 
        $banners = Banner::orderby('is_active','desc')->paginate($this->per_page);
        return view('admin.settings.banner',compact('banners'));	

    }

    public function bannerActionCreate(Request $request){
        check_permission_access('add banner'); 
        $banner = NULL;
        if (isset($request->banner_id)){      
            check_permission_access('edit banner'); 
            $banner = Banner::whereId($request->banner_id)->first();
        }
       
        return view('admin.settings.createBannerForm',compact('banner'));	
    }

    public function bannerActionSave(Request $request){

        $msg = 'something went wrong';
        check_permission_access('add banner');  
        check_permission_access('edit banner'); 

        $newBanner = [];
        $newBanner['content_heading'] = trim($request->content_heading);
        $newBanner['content_desc'] = trim($request->content_description);
        $newBanner['is_active']  =  ($request->status=='on' ? 1: 0);
        $newBanner['button'] = trim($request->button_link);
        $newBanner['button_text'] = trim($request->button_text);

        $validation = [
            'content_heading' => ['required', 'string', 'max:255'],

            
        ];

        if (isset($request->image)){
            $image = $request->file('image');
            $validation ['image'] =  'image|mimes:jpeg,jpg,png|max:2048|required';
            }else{
                $image = null;
                $newBanner['image'] = $request->old_image;
            }
        $request->validate($validation);

        if($image){
            $newBanner['image'] = time() . '_banner_image.' . $image->getClientOriginalExtension();
        
            if (!is_dir($this->banner_path)) {
                mkdir($this->banner_path, 0777,true);
            }
            $imageResult = $image->move($this->banner_path,  $newBanner['image']);
    
        }
        if ($request->banner_id=='null'){
        
            $banner = Banner::create($newBanner);
            $msg = 'Banner  Added successfully.';

        }else{
            $banner = Banner::whereId($request->banner_id)->update($newBanner);
            $msg = 'Banner  updated successfully.';
            if ($banner && $image){
                if (file_exists($this->banner_path.'/'.$request->old_image)){
                    unlink($this->banner_path.'/'.$request->old_image);
                }
            }
       
        }
  
        return redirect('admin/settings/banner')->with('status',$msg);


    }
    public function bannerActionDelete(Request $request){
        $msg = 'something went wrong';
        check_permission_access('delete banner'); 

        if (isset($request->banner_id)){
            $banner = Banner::whereId($request->banner_id)->delete();
            $msg = $banner ? 'Banner  Delete successfully.' : 'something went wrong';
        }
        return redirect('admin/settings/banner')->with('status',$msg);

    }
    
}

