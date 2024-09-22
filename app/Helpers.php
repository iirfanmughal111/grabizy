<?php
//use DB;


use App\Models\User;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use App\Models\Notification;

use App\Models\Setting;
use Carbon\Carbon;

use App\Models\Category;
use App\Models\Message;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Support\Facades\DB;

use App\Models\WishList;






	// function banner_photo($user_id){
		
	// 	      $user_data = User::where('id',$user_id)->get();
	// 		  $banner_image =   url('/uploads/users').'/'. $user_data[0]->id .'/'. $user_data[0]->banner_photo;
	// 		  return $banner_image ;

	// }

	//use Config;
	// Return User Role ID 
	// function current_user_role_id(){
	// 	$user = \Auth::user();
	// 	return $user->role_id;
	// }

	function is_admin(){
		$user = Auth::user();
		$role = $user->hasRole('admin');
		return true;
	} 
	/* Get Loggedin User data */
	function user_data(){
		$user = Auth::user();
		return $user;
	}

	/* Get Current User ID */
	// function user_id(){
	// 	$user = \Auth::user();
	// 	return $user->id;
	// }

	/* Get User data by ID  */
	// function user_data_by_id($id){
	// 	$userData = User::where('id',$id)->get();
	// 	return $userData[0];
	// }



	function profile_photo($slug){
		
		if (file_exists( public_path() . '/uploads/user/'.$slug)) {
            return '/uploads/user/'.$slug;
        } else {
            return '/no-image.png';
        }
		
	}

	function check_permission_access($permission){
		$user = \Auth::user();
		if(!$user->hasPermissionTo($permission)){
			abort(403);
			abort(404);
		}
	}




	// GET THE IP ADDRESS 
	function get_client_ip() {
		$ipaddress = '';
		if (isset($_SERVER['HTTP_CLIENT_IP']))
			$ipaddress = $_SERVER['HTTP_CLIENT_IP'];
		else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
			$ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
		else if(isset($_SERVER['HTTP_X_FORWARDED']))
			$ipaddress = $_SERVER['HTTP_X_FORWARDED'];
		else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
			$ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
		else if(isset($_SERVER['HTTP_FORWARDED']))
			$ipaddress = $_SERVER['HTTP_FORWARDED'];
		else if(isset($_SERVER['REMOTE_ADDR']))
			$ipaddress = $_SERVER['REMOTE_ADDR'];
		else
			$ipaddress = 'UNKNOWN';
	return $ipaddress;
	}

	// Show Site Title 
	function showSiteTitle(){
	
		if (!session()->has('site_title')){
			$settings = Setting::first();
			if ($settings){
				session()->put('site_title', $settings->site_title);
			}else{
				session()->put('site_title',trans('global.site_title'));
			}
		}
		return session()->get('site_title');
	}

	function showFavicon(){

		if (!session()->has('site_logo')){
			$settings = Setting::first();
			if ($settings){
				session()->put('site_logo', $settings->site_logo);
			}else{
				session()->put('site_logo',trans('global.site_logo'));

			}
		}

		return url('images/logo/'.session()->get('site_logo'));
	}

	function showLogo(){

		if (!session()->has('site_logo')){
			$settings = Setting::first();
			if ($settings){
				session()->put('site_logo', $settings->site_logo);
			}else{
				session()->put('site_logo',trans('global.site_logo'));

			}
		}

		return url('images/logo/'.session()->get('site_logo'));
		
	}

	function listCateogories(){
		$categoreis = Category::where('is_active',1)->get();
		return $categoreis;
		$list = '';
		foreach($categoreis as $cat){
			$list .= "<a class='dropdown-item border-0 transition-link' href='index.html'>Homepage</a>";
		}
		

		return $list;
	}

	function unReadMessages(){
		return Message::where('read_at',null)->count();

	}

	function cartItemsCount(){

		if (!session()->has('cart_count')){
			session()->put('cart_count', Cart::where('user_id',Auth::user()->id)->count());
		}
		return session()->get('cart_count');

	}
	function wishListItemsCount(){
		return Message::where('read_at',null)->count();

	}

	function orderCount($user_id){
		return Order::where('user_id',$user_id)->count();

	}

	function readNotificationById($notification_id){
		if ($notification_id){
			$userNofitication =  DB::table('notifications')
			->whereId($notification_id)->get();
		if (count($userNofitication)){
			if ($userNofitication[0]->sync_id != null){
				DB::table('notifications')
				->where('sync_id',$userNofitication[0]->sync_id)->update(['read_at' => now()]);   
			}
			else{
					DB::table('notifications')
					->where('id',$notification_id)->update(['read_at' => now()]);  
				}

		}
		}
			
	}

	function showMetaDescription(){

		if (!session()->has('meta_description')){
			$settings = Setting::first();
			$meta_desc = $settings && $settings->meta_desc ? $settings->meta_desc : '';
			session()->put('meta_description', $meta_desc);
			
		}
		return session()->get('meta_description');
		
	}

	function getSocialLink($type){

		if (!session()->has($type)){
			$settings = Setting::first();
			$url_link = $settings && $settings->$type ? $settings->$type : NULL;
			session()->put($type, $url_link);
		}
		return session()->get($type);

	}
	 function getStoreAddress(){

		if (!session()->has('storeAddress')){
			$settings = Setting::first();
			$shop_address = $settings && $settings->shop_address ? $settings->shop_address : '';
			session()->put('storeAddress', $shop_address);
		}
		return session()->get('storeAddress');
	}

	function getStoreEmail(){

		if (!session()->has('shop_email')){
			$settings = Setting::first();
			$shop_email = $settings && $settings->shop_email ? $settings->shop_email : '';
			session()->put('shop_email', $shop_email);
		}
		return session()->get('shop_email');

	}

	function getStoreContact(){

		if (!session()->has('shop_contact')){
			$settings = Setting::first();
			$shop_contact = $settings && $settings->shop_contact ? $settings->shop_contact : '';
			session()->put('shop_contact', $shop_contact);
		}
		return session()->get('shop_contact');

	}

	function getPerPageItem(){

		if (!session()->has('items_per_page')){
			$settings = Setting::first();
			$items_per_page = $settings && $settings->items_per_page ? $settings->items_per_page : null;
			session()->put('items_per_page', $items_per_page);
		}
		return session()->get('items_per_page');

	}

	function getPerPageProducts(){

		if (!session()->has('prod_per_page')){
			$settings = Setting::first();
			$prod_per_page = $settings && $settings->prod_per_page ? $settings->prod_per_page : null;
			session()->put('prod_per_page', $prod_per_page);
		}
		return session()->get('prod_per_page');

	}
	// function urlsafe_b64decode($string)
	// {
	// 	$ciphering = "AES-128-CTR";
	// 	$decryption_key = "GeeksforGeeks";
	// 	$options = 0;
	// 	$iv_length = openssl_cipher_iv_length($ciphering);
	// 	$decryption_iv = '1234567891011121';
	// 	return openssl_decrypt ($string, $ciphering,$decryption_key, $options, $decryption_iv);
	// }







	/*
	* Function that return unread message count of login User by particular user groups
	*/

	// ForWebinarTimeConverstion
	const SECONDS_PER_MINUTE = 60;
	const SECONDS_PER_HOUR = 60 * SECONDS_PER_MINUTE;
	const SECONDS_PER_DAY = 24 * SECONDS_PER_HOUR;

	const DAYS_PER_YEAR = 365;
	const DAYS_PER_LEAP_YEAR = DAYS_PER_YEAR + 1;

	const EPOCH_MONTH = 1;
	const EPOCH_YEAR = 1970;

	function isLeapYear(int $year) : bool
	{
		return $year % 400 === 0 || ($year % 4 === 0 && $year % 100 !== 0);
	}

	function getDaysForYear(int $year) : int {
		return isLeapYear($year) ? DAYS_PER_LEAP_YEAR : DAYS_PER_YEAR;
	}

	function getDaysPerMonth(int $year) : array
	{
		return [0, 31, isLeapYear($year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	}

	function extractDate($timestamp){

		$date = date('d/m/Y', $timestamp);
		$unixDate = strtotime($date);
		return $unixDate;

	}
	function extractTime($timestamp){
		$time = date('H:i:s', $timestamp);
		$unixTime = strtotime($time);
		return $unixTime;

	}
