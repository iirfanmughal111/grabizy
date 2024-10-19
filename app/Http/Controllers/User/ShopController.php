<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Config;
use App\Http\Controllers\Admin\ProductController;
use App\Models\Product;
use App\Models\Category;
use App\Models\Cart;
use App\Models\WishList;
use  App\Models\User;
use  App\Models\Order;
use  App\Models\OrderItem;
use  App\Models\profile;
use  App\Models\Shipping;
use  App\Models\Setting;
use  App\Models\Auction;
use  App\Models\Banner;
use App\Services\CJService;
use Symfony\Component\HttpFoundation\Cookie;

use App\Mail\UserNoticeEmail;
use Illuminate\Support\Facades\Mail;

use App\Notifications\userAdminNotifcation;


use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use DB;
use Response;
class ShopController extends Controller
{
    protected $per_page,$min_price,$max_price,$margin;
    public function __construct()
    {
        $this->per_page = getPerPageProducts();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
            $this->min_price = 0;
            $this->max_price = 2000;
            $this->margin = 100;


    }
    public function landing(){
      
        $trendingProds = Product::where('is_visible',1)->where('sale_price',null)->orderBy('order_count','desc')->limit(4)->get();
        $saleProds = Product::where('is_visible',1)->where('sale_price','!=',null)->orderBy('id','desc')->limit(4)->get();

        $banners = Banner::where('is_active',1)->get();
        $trendingCats = Category::where('is_active',1)->where('is_trending',1)->limit(6)->inRandomOrder()->get();
        
        $cartIds = $wishListIds = [];
            if (auth::check()){
                $cartIds = Cart::where('user_id',Auth()->user()->id)->pluck('product_id')->toArray();
                $wishListIds = WishList::where('user_id',Auth()->user()->id)->pluck('product_id')->toArray();
            }
        return view('frontend.landing',compact('trendingProds','saleProds','trendingCats','banners','cartIds','wishListIds'));
    }
    public function shop(Request $request){
            $results = $this->filter($request);
            $products = $results['products'];
            $filters = $results['filters'];
          
            $cartIds = $wishListIds = [];
            if (auth::check()){
                $cartIds = Cart::where('user_id',Auth()->user()->id)->pluck('product_id')->toArray();
                $wishListIds = WishList::where('user_id',Auth()->user()->id)->pluck('product_id')->toArray();
            }
          
            $categories = Category::where('is_active',1)->get();

                return view('frontend.shop.shop',compact('products','categories','wishListIds','cartIds','filters'));
            }

    protected function filter($request){

        $query = Product::where('is_visible', 1);
        $filters = [];
        $filters['margin'] = $this->margin;
        $filters['categories'] = [];
        $filters['showOnly'] = 'undefined';
        $filters['deals'] = 'undefined';
        $filters['sort_by'] = 'default';

        $filters['title'] ='';
        
        if ($request->category_id && $request->category_title){
            if ($request->category_id==0){
            $query->where('category_id',null);

            }
            else{
            $query->where('category_id',$request->category_id);
                
            } 
            
            $filters['categories'] = [$request->category_id];
        }
        if (isset($request->title)){
            $query->where('title', 'LIKE', '%' . $request->title . '%');
            $filters['title'] = $request->title;
        }

        if (isset($request->categories) && count($request->categories) > 0 ){
            $query->whereIn('category_id',$request->categories);
            $filters['categories'] = $request->categories;
           
        }
        if (
            isset($request->min_price) 
            && isset($request->max_price)
            && $request->max_price > $this->margin

            ){

            $query->where('regular_price','>=',$request->min_price);
            $query->where('regular_price','<=',$request->max_price);
            $filters['min_price'] = $request->min_price;
            $filters['max_price'] = $request->max_price;

            
        }
    
        if (isset($request->showOnly) && count($request->showOnly) > 0 ){
            if ($request->showOnly[0] == 'deals'){
                $query->where('sale_price','!=', null);
            }
            $filters['deals'] = trim($request->showOnly[0]);
            // elseif ($request->showOnly== 'freeShipping'){
            //     $query->where('sale_peice','!=', null);
            // }
        }

        if (isset($request->sort_by) && $request->sort_by != 'default'){
            if ($request->sort_by == 'title-desc'){
                $query->orderBy('title', 'desc');
            }
            elseif ($request->sort_by== 'title-asec'){
                $query->orderBy('title', 'asc');
            }
            elseif ($request->sort_by== 'low-high'){
                $query->orderBy('regular_price', 'asc');
            }
            elseif ($request->sort_by== 'high-low'){
                $query->orderBy('regular_price', 'desc');
            }
            elseif ($request->sort_by== 'popularity'){
                $query->orderBy('order_count', 'desc');
            }

            $filters['sort_by'] = $request->sort_by;

        }
        $data['filters'] =  $filters;
        $data['products'] =  $query->inRandomOrder()->simplePaginate($this->per_page); 
        return    $data;            
    }

            public function view(Request $request){
             //   dd(WishList::where('product_id', 10)->where('user_id',1)->first());
         
                if ($request->product_id){
                    $product = Product::whereId($request->product_id)->first();
                    if ($product){
                        $shareButtons = \Share::page(
                            url('shop/view/'.$product->id.'/'.str_replace(' ','-',$product->title)),
                            str_replace(' ','-',$product->title),
                        )
                        ->facebook()
                        ->twitter()
                        ->linkedin()
                        ->telegram()
                        ->whatsapp()        
                        ->reddit();
                        $product->cjProductVarients = [];
                       if ($product->cj_pId){
                       $cjService = new CJService();
                       $product->cjProductVarients = $cjService->getProductById($product->cj_pId);
                       }
                       
                        $similarProducts = Product::where('is_visible',1)->where('id','!=',$product->id)->where('category_id',$product->category_id)->limit(8)->inRandomOrder()->get();
                        
                        $cartIds = $wishListIds = [];
                        if (!count($similarProducts)){
                            $similarProducts = Product::where('is_visible',1)->where('id','!=',$product->id)->orderBy('order_count','desc')->limit(8)->get();
                        }
                        if (auth::check()){
                            $cartIds = Cart::where('user_id',Auth()->user()->id)->pluck('product_id')->toArray();
                            $wishListIds = WishList::where('user_id',Auth()->user()->id)->pluck('product_id')->toArray();
                        }
                     
                        return view('frontend.shop.viewProduct',compact('product','similarProducts','cartIds','wishListIds','shareButtons'));
                    }
                }
                return redirect('/not-found');
               
            }


            public function wishList(Request $request){
                $data = [];
                $data['success'] = false;
                $data['type'] = false;
                if(Auth::check()){
                    $data['login'] = true;
                    $wishData = [];
                    if ($request->product_id){
                        $wishData['product_id'] = $request->product_id;
                        $wishData['user_id'] = Auth::user()->id;

                    $existedWish = WishList::where('product_id', $wishData['product_id'])->where('user_id',$wishData['user_id'])->first();

                    $product = Product::whereId($request->product_id)->first();

                    $data['success'] = true;
                    if (!empty($existedWish) && $existedWish != null){
                        $wish = $existedWish->delete();
                        $data['msg'] = 'Product removed from Wishlist ';
                        $data['type'] = 'remove';
                        if ($product && $product->wishList_count>0){
                            $product->update(['wishList_count'=>$product->wishList_count-1]);
                        }else if($product){
                            $product->update(['wishList_count'=>0]);
                        }

                    }
                    elseif (empty($existedWish) && $existedWish == null){
                            $wish = WishList::create($wishData);
                            $data['msg'] = 'Product added  to Wishlist';
                            $data['type'] = 'add';
                           if($product){
                                $product->update(['wishList_count'=>$product->wishList_count+1]);
                            }
                   
                    }
                }
                    else{
                        $data['msg'] = 'Something went wrong';
                    }
                
            }
            else{
                //return redirect('/login');
                $data['msg'] = 'login Required!!!';        
            }
                return $data;  
            }


            public function addToCart(Request $request){
                $data = [];
                $data['success'] = false;
                $data['msg'] = 'Something went wrong';
                if(Auth::check()){
                  
                    $data['login'] = true;
                    $cartData = [];
                    if ($request->product_id){
                        $product = Product::whereId($request->product_id)->first();
                        if ($request->status == 1){
                            // 1 exists in cart , 0 not exits in cart
                            Cart::where('product_id', $request->product_id)->where('user_id',Auth::user()->id)->delete();
                            $data['msg'] = 'Product removed from Cart';
                            $data['success'] = true;
                            if ($product && $product->cart_count>0){

                                $product->update(['cart_count'=>$product->cart_count-1]);
                            }else if($product){
                                $product->update(['cart_count'=>0]);
                            }

                            $data['cart_count'] = Cart::where('user_id',Auth::user()->id)->count();
                            session()->put('cart_count', $data['cart_count']);
                            return $data;

                        }else{
                        $cartData['product_id'] = $request->product_id;
                        $cartData['user_id'] = Auth::user()->id;
                        $cartData['count'] =  $request->quantity;

                    $existedProduct = Cart::where('product_id', $cartData['product_id'])->where('user_id',$cartData['user_id'])->first();
                    $data['success'] = true;
                    if (!empty($existedProduct) && $existedProduct != null){
                        $wish = $existedProduct->update($cartData);
                        $data['msg'] = 'Cart product quantity updateed successfully';
                    }
                    elseif (empty($existedProduct) && $existedProduct == null){
                        if ($product->cj_pId && $request->vid  && $request->vid > 0){
                            $cartData['cj_vId'] = $request->vid;
                            $cartData['cj_vTitle'] = $request->vTitle;
                            $cartData['cj_vImg'] = $request->vImg;
                        }
                        else{
                            $data['success'] = false;
                            $data['msg'] = 'Product have multiple varients. Select one <strong> varient.</strong>';
                            return $data;
                        }
                        $prod = Cart::create($cartData);
                        if ($prod){                  
                            $data['msg'] = '<strong>('.$prod->count.')</strong> items added to Cart ';
                        }
                        $product->update(['cart_count'=>$product->cart_count+1]);

                    }
                    $data['cart_count'] = Cart::where('user_id',Auth::user()->id)->count();
                    session()->put('cart_count', $data['cart_count']);

                }
            }
            
        }
           
        return $data;  
    }

           

            
            public function cart(Request $request){
         
                if(Auth::check()){
                    $products = Cart::where('user_id',Auth::user()->id)->get();
                    $coupon = false;
                return view('frontend.shop.cart',compact('products','coupon'));
            }
            return view('frontend.shop.cart');
           
            }
            // public function updateState($prod_id,$col,$type){
            //     $product = Product::whereId($prod_id)->first();
            //     if ($type==0){
            //     if ($product && $product->col>0){

            //         $product->update([$col=>$product->col-1]);
            //     }else if($product){
            //         $product->update([$col=>0]);
            //     }
            // }elseif($type==1){
            //     if($product){
            //         $product->update([$col=>$product->col+1]);
            //     }

            // }

            // }

            public function cartCoupon(Request $request){
         
                if(Auth::check()){
             dd($request->payment_method);exit;
                    if ($request->coupon=='1234'){
                        $msg = 'coupon applies to your order';
                    }
                    else{
                        
                        $msg = 'coupon not applicable';
                    }
                    $coupanVal = $request->coupon;

                    $products = Cart::where('user_id',Auth::user()->id)->get();
                    $coupon = true;
                    session()->flash('status', $msg);
                    return view('frontend.shop.cart',compact('products','coupon','coupanVal'));

            }
            return view('frontend.shop.cart');
           
            }
            public function verifyProfile($request){
                $profile = [];
                $profile['user_id'] = Auth::user()->id;
                $profile['phone'] = $request->phone;
                $profile['comapny'] = trim($request->comapny);
                $profile['country'] = trim($request->country);
                $profile['region'] = trim($request->region);
                $profile['city'] = trim($request->city);
                $profile['zip']  =  trim($request->zip);
                $profile['address_line1'] = trim($request->address_line1);          
                $profile['address_line2'] = trim($request->address_line2);

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
                if (!Auth::user()->Profile){
                    $prof = Profile::create($profile);
                }
            }
            public function orderPlaced(Request $request){
                if(Auth::check()){
                    $this->verifyProfile($request);
                    $cart = Cart::where('user_id', Auth::user()->id)->with('Product')->get();
                            
                    if ($cart){
                   
                        $order = Order::create(
                            [
                                'user_id' => Auth::user()->id,
                                'status_id' => 1,
                                'note' => trim($request->note),
                                'payment_method' => $request->payment_method ? trim($request->payment_method) : 'cod', 
                                'order_no' => time(),
                                'payment_id'=>null,
                                'shipping_cost'=>0,
                            ]
                        );
                    if ($order){
                        $sum = 0;
                        $weight = 0;
                        $new_order = Order::latest()->with('User','Status',)->first();
                        $productIds=[];
                        $cartIds=[];

                        foreach($cart as $c){
                            OrderItem::create([
                                'order_id' => $new_order->id,
                                'product_id' => $c->product_id,
                                'quantity' => $c->count,
                                'cj_Id' => $c->cj_vId,

                            ]);
                            if ($c->Product->sale_price){
                                $sum += ($c->Product->sale_price*$c->count);
                            }
                            else{
                                $sum += ($c->Product->regular_price*$c->count);
                            }
                                $product = Product::whereId($c->product_id)->first();
                                $product->update(['cart_count'=>$product->cart_count-1,'order_count'=>$product->order_count+1]);
                           
                               // Product::whereId( $c->product_id)->decrement('cart_count');
                               $weight += $c->Product->weight*$c->count;
                               
                                $c->delete();
                        }
                        // Product::whereIn('id',$productIds)->increment('order_count');

                    
                    $shipping = Shipping::where('country',Auth::user()->Profile->country)
                        ->where('region',Auth::user()->Profile->region)
                        ->where('is_active',1)->where('weight_from','<=',$weight)
                        ->where('weight_to','>=',$weight)->first();

                        $newOrderupdata = ['order_payment'=>$sum];
                        
                        if ($shipping){
                            $newOrderupdata['shipping_cost'] =  $shipping->cost;
                            $newOrderupdata['status_id'] = 2;
                        }
                        $new_order->update($newOrderupdata);

                        $admins = User::role('admin')->get();
                        $staffs = User::role('staff')->get();
                        $sycn_id = time();
                        foreach($admins as $admin){
                            $admin->notify(new userAdminNotifcation(Auth::user(),'1','New Order '.$new_order->order_no. ' has been placed by '.Auth::user()->name));

                            $userNofitication=$admin->notifications()->get()->first();
                            $userNofitication->sync_id=$sycn_id;
                            $userNofitication->save();
                        }
                        foreach($staffs as $staff){
                            $staff->notify(new userAdminNotifcation(Auth::user(),'1','New Order# '.$new_order->order_no. ' has been placed by '.Auth::user()->name));

                            $userNofitication=$staff->notifications()->get()->first();
                            $userNofitication->sync_id=$sycn_id;
                            $userNofitication->save();
                         }
                         $settings = Setting::first();
                         if ($settings->send_mail && $new_order->User->email_verified_at != null){
                            Mail::to($new_order->User->email)->send(new UserNoticeEmail('Order Details',$new_order->Status->message,$new_order,$new_order->User->name.' Your Order# '.$new_order->order_no.' Placed successfully.'));
                        }
                         $new_order->User->notify(new userAdminNotifcation($new_order->User,'2',$new_order->User->name.' Your Order# '.$new_order->order_no.' Placed.'));

                    }
                    $msg = 'Order placed successfully.';
                    session()->forget('cart_count');

                    }
                    else {
                        $msg = 'Your cart is empty.';
                    }
            
                    return redirect('/shop')->with('status', $msg);

                 }

                return redirct('/login');
            }


            public function updateCart(Request $request){
                $data = [];
                $data['success'] = false;
                if(Auth::check()){
                    $cartData = [];
                    if ($request->cart_id){
                        $cartItem = Cart::whereId($request->cart_id)->first();

                    if (!empty($cartItem) && $cartItem != null){
                        if ($request->quantity <= 0){
                            $cartItem->delete();  
                        $data['msg'] = 'Product removed from cart due to zero quantity';

                        }
                        else{
                        $wish = $cartItem->update(['count'=>$request->quantity]);
                        $data['msg'] = 'Cart updated successfully';
                        $data['success'] = true; 
                        }
                        

                    }
                   
                }
                    else{
                        $data['msg'] = 'Something went wrong';
                    }
                
            }   
                return $data;  
            }

            public function deleteCart(Request $request){
                $data = [];
                $data['success'] = false;
                $data['msg'] = 'Something went wrong';
                if(Auth::check()){
                    $cartData = [];
                    if ($request->product_id){
                        $cartItem = Cart::where('product_id',$request->product_id)->where('user_id',Auth::user()->id)->first();
                    if (!empty($cartItem) && $cartItem != null){
                            $cartItem->delete();  
                $data['success'] = true;

                        $data['msg'] = 'Product removed from cart';
                    }                    
                    }
                }
                             
                return $data;  
            }
            
            public function checkOut(Request $request){
          
                if(Auth::check()){
                    if (Auth::user()->Profile){
                        $cart = Cart::where('user_id',Auth::user()->id)->get(); 
                        $weight = 0;
                        foreach($cart as $key => $product){
                            $weight += intval($product->Product->weight)*$product->count;
                        }
                   
                        $shipping = Shipping::where('country',Auth::user()->Profile->country)->where('region',Auth::user()->Profile->region)->where('is_active',1)->where('weight_from','<=',$weight)->where('weight_to','>=',$weight)->first();
                        
                         
                        return view('frontend.shop.checkout',compact('shipping','cart'));
                    }else{
                        return redirect('dashboard/profile')->with('status', 'Please fill out your profile to before placing order.');
                    }
                    
                }
        }

            public function viewOrder(Request $request){
                $user = Auth::user();
                if($user && $request->order_no){
                    $order = Order::where('order_no',$request->order_no)->first();
                    if ($order){
                        readNotificationById($request->notification);
                    if (($user->hasRole('admin') || $user->hasRole('staff')) && $user->hasPermissionTo('listing orders')){
                        return view('admin.order.viewOrder',compact('order'));
                    }
                 
                    if ($order->user_id == $user->id){
                        return view('frontend.order.order',compact('order'));
                    }
                }
            }
                return view('admin.partials.error404');
            
            }

            public function listingTypeGrid(Request $request){

                $minutes = 60;
                // $response = new Response('Set Cookie');
                // $response->withCookie(cookie('sort_type', 'grid', $minutes));
                Cookie::queue('sort_type', 'grid', 1);
                // $request->cookie('sort_type', 'grid', 60);
               dd($request->cookie());
            }

            public function listingTypeList(Request $request){

                dd('1');
            }
   
}
