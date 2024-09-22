<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;

use Spatie\Permission\Models\Role;
use  App\Models\User;
use  App\Models\Profile;
use  App\Models\Order;
use  App\Models\OrderItem;
use  App\Models\Shipping;


use  App\Models\Status;
use App\Mail\UserNoticeEmail;
use Illuminate\Support\Facades\Mail;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Http\Request;
use App\Notifications\userAdminNotifcation;

use Config;
use Illuminate\Foundation\Auth\User as Authenticatable;
class ShopController extends Controller
{
    public function __construct()
    {
        // $this->category_path = public_path('/uploads/users');
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
    }

    // ----------------------------------------------------------------For Order Status
        public function status(Request $request){
            check_permission_access('listing order status'); 
            $status = Status::all();
            return view('admin.status.status',compact('status'));		
        }

        public function statusAddEdit(Request $request){
            check_permission_access('edit order status'); 
            check_permission_access('add order status'); 

                    $status = null;
                    if ($request->status_id){
                    $status = Status::whereId($request->status_id)->first();
                return view('admin.status.createStatusForm',compact('status'));		
            }
        
            
        }
    public function statusDelete(Request $request){
        check_permission_access('delete order status'); 

        $data['success'] = false;
        $data['msg'] = 'Something went wrong!!!';

        if ($request->status_id){
            $status = Status::whereId($request->status_id)->delete();
            $data['success'] = true;
            $data['msg'] = 'Order status has been deleted successfully';
    }
        
            return $data;		
        
    }

        public function statusStore(Request $request){

        
            check_permission_access('add order status'); 

               
                    $status = null;
                    $request->validate(['status_value' =>'required', 'string', 'max:255',
                    'status_message' =>'required', 'string', 'max:255'
                ]);

                    if ($request->status_id == 'null'){
                        $status = Status::create(['value' =>$request->status_value,
                        'is_active' =>  1,
                        'message' =>  $request->status_message,
                        ]);
                        $msg= 'New Order Status added successfully';
                
                       
                }
                else{
                    $status = Status::whereId($request->status_id)->update(['value' =>$request->status_value,
                        'is_active' =>  1,
                        'message' =>  $request->status_message,
                        ]);
             
                $msg= 'Order Status updated successfully';

                }

                return redirect('admin/status')->with('status',$msg);		
            
        }

        // ----------------------------------------------------------------For Orders
        public function shop(Request $request)
        {
 
            check_permission_access('listing orders'); 
                    $query = Order::where('user_id','!=','');
                    $filters = [];
                    $filters['order_no'] = null;
                    $filters['status_id'] = null;
                    if (isset($request->order_no)){
                        $query->where('order_no', $request->order_no);
                        $filters['order_no'] = $request->order_no;
                    }
            
                   if (isset($request->order_status) && $request->order_status != 'null'){
                    $query->where('status_id', $request->order_status);
                    $filters['status_id'] = $request->order_status;
              
                   }
                        $orders =  $query->orderBy('order_no','DESC')->paginate($this->per_page);
                        $status = Status::all();
                        $trash = 0;
                    return view('admin.order.order',compact('orders','status','trash','filters'));		
        }

    public function shopTrash(Request $request)
    {
        
        check_permission_access('listing trash'); 
        check_permission_access('listing orders'); 
        $filters = [];
        $filters['order_no'] = null;
                    $filters['status_id'] = null;
        $query = Order::where('user_id','!=','');
        if (isset($request->order_no)){
            $query->where('order_no', $request->order_no);
            $filters['order_no'] = $request->order_no;

        }

       if (isset($request->order_status) && $request->order_status != 'null'){
        $query->where('status_id', $request->order_status);
  
       }
            $orders =  $query->onlyTrashed()->orderBy('deleted_at','DESC')->paginate($this->per_page);
            $status = Status::all();
            $trash = 1;
        return view('admin.order.order',compact('orders','status','trash','filters'));		
    }

    public function orderStatusUpdate(Request $request){
        check_permission_access('edit orders'); 

                $data['success'] = false;
                $data['msg'] = 'Something went wrong!!!';

                if (isset($request->order_id) && isset($request->order_status)){
                    $order = Order::whereId($request->order_id)->with('User','Status',)->first();
                    $update = $order->update(['status_id' => $request->order_status]);
                    
                    if ($order->User->email_verified_at != null && $update){
                        Mail::to($order->User->email)->send(new UserNoticeEmail('Order Details',$order->Status->message,$order,'Hey '.$order->User->name.' Your Order# '.$order->order_no.' status updated.'));
                    }
                     $order->User->notify(new userAdminNotifcation($order->User,'2',$order->User->name.' Your Order# '.$order->order_no.' status updated.'));

                    $data['success'] = true;
                    $data['msg'] = 'Order status has been updated successfully';
            }
     
            return $data;		
        
    }
    
    public function orderDelete(Request $request){
        check_permission_access('delete orders'); 

            $data['success'] = false;
            $data['msg'] = 'Something went wrong!!!';
            if (!$request->trash){
                $trash = 0;
            }
            if ($request->orderId){
                if ($request->trash==0){
                    $order = Order::whereId($request->orderId)->with('OrderItem')->first();
                }
                else if ($request->trash==1){
                    $order = Order::whereId($request->orderId)->onlyTrashed()->with('OrderItem')->first();

                }
                
                if ($order){
                    $data['success'] = true;
                    if ($order->User){
                        $order->User->notify(new userAdminNotifcation($order->User,'2',$order->User->name.' Your Order# '.$order->order_no.' cancelled.'));
                    }
                        if ($request->trash == 0 ){
                            $order->delete();
                        if (isset($order->OrderItem[0])){
                            OrderItem::whereId($order->OrderItem[0]->id)->delete();
                        }
                    $data['msg'] = 'Order has been deleted successfully';
                        
                        }else if ($request->trash == 1 ){
                        $order->forceDelete();
                        if (isset($order->OrderItem[0])){
                            OrderItem::whereId($order->OrderItem[0]->id)->forceDelete();
                        }
                    $data['msg'] = 'Order has been deleted permanently';
                        }
                        
                

                }
            }
     
            return $data;		
    }


    public function shopRestore(Request $request){
        check_permission_access('edit orders'); 

        $data['success'] = false;
        $data['msg'] = 'Something went wrong!!!';

        if ($request->orderId){   
            $order = Order::whereId($request->orderId)->restore();

            if ($order){
                $data['success'] = true;
            //       $order->User->notify(new userAdminNotifcation($order->User,'2',$order->User->name.' Your Order# '.$order->order_no.' cancelled.'));

                        OrderItem::withTrashed()->where('order_id',$request->orderId)->restore();    
                $data['msg'] = 'Order has been restored successfully';      
                }
        }

        return $data;		  
    }
    public function shipping(Request $request){
            check_permission_access('listing shipping'); 
            $shippings = Shipping::paginate($this->per_page);
            return view('admin.shipping.shipping',compact('shippings'));
    }

    public function shippingCost(Request $request){
        check_permission_access('add shipping'); 
        check_permission_access('edit shipping'); 

        if ($request->isMethod('Get') && isset($request->id)){
            $shipping = Shipping::whereId($request->id)->first();
            if ($shipping){
                return view('admin.shipping.shippingCreateForm',compact('shipping'));
            }
            
            return view('admin.shipping.shippingCreateForm');

        }elseif ($request->isMethod('Get')){
            return view('admin.shipping.shippingCreateForm');

        }
        

        if ($request->isMethod('post')){
            $request->validate(['country' =>'required', 'string', 'max:255',
            'region' =>'required', 'string', 'max:255',
            'cost' =>'required', 'integer',
            'weight_from' =>'required', 'integer',
            'weight_to' =>'required', 'integer','gt:weight_from',
        ]);
    
        $data = [
            'country' =>$request->country,
            'region' =>$request->region,
            'cost' =>$request->cost,
            'weight_from' =>$request->weight_from,
            'weight_to' =>$request->weight_to,
            'is_active' =>($request->is_active=='on' ? 1: 0),
        ];
        
        $existedZone = Shipping::where('country',$request->country)->where('region',$request->region)->where('weight_from',$request->weight_from)->where('weight_to',$request->weight_to)->first();
        if ($existedZone && $request->shipping_id == 'null'){
            return back()->with('status', 'Shipping Zone aleredy exist for this region and weight. please edit exited zone.');
        }
        if ($request->shipping_id != 'null') {
            Shipping::whereId($request->shipping_id)->update($data);
            $msg = 'Shipping Zone updated successfully';

        }else{
            Shipping::create($data);
            $msg = 'New Shipping Zone created successfully';

        }

        }
        return redirect('admin/shop/shipping/')->with('status', $msg);
        
    }

    public function shippingCostDelete(Request $request){

        check_permission_access('delete shipping');
            $data = [];
            $shipping = Shipping::whereId($request->deleteShippingId)->first();
            if ($shipping){
                $shipping->delete();
                // Show message on the basis of status 
                $data['msg'] = 'Shipping Zone  deleted successfully';
                $data['success'] = true;
            }
            else{
                $data['success'] = false;
                $data['msg'] = 'Something went wrong';
            }
            return $data;
        
    }
}