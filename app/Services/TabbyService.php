<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;

use App\Cart;

use Modules\Booking\Models\Booking;
use Modules\Booking\Models\PaymentSession;
use Modules\User\Models\Wallet\DepositPayment;
use Modules\User\Models\Transaction;

use Config;
class TabbyService 
{
    public $base_url ,$base_url_v1 ,$public_key ,$secret_key;

    public function __construct()
    {
		$this->base_url  = Config::get('constant.tabby.base_url');
		$this->base_url_v1  = Config::get('constant.tabby.base_url_v1');
		// $this->public_key  = Config::get('constant.tabby.pk_test');
		// $this->secret_key  = Config::get('constant.tabby.sk_test');
    }
    public function setApiKey($key){
        $this->secret_key  = $key;
        // $this->public_key  = Config::get('constant.tabby.sk_test');
    }
    public function setPublicKey($key){
        $this->public_key  = $key;
    }
    

    public function createSession($data)
    {
        $body = $this->getConfig($data);

        $http = Http::withToken($this->public_key)->baseUrl($this->base_url);

        $response = $http->post('checkout',$body);

        return $response->object();
    }

    public function getSession($payment_id)
    {
        $http = Http::withToken($this->secret_key)->baseUrl($this->base_url);

        $url = 'checkout/'.$payment_id;

        $response = $http->get($url);

        return $response->object();
    }

    public function retrivePayment($payment_id)
    {
        $http = Http::withToken($this->secret_key)->baseUrl($this->base_url);
        
        $url = 'payments/'.$payment_id;

        $response = $http->get($url);

        return $response->object();
    }
    

    public function refundPayment($payment_id,$body)
    {
        $http = Http::withToken($this->secret_key)->baseUrl($this->base_url);
        
        $url = 'payments/'.$payment_id.'/refunds';
        $response =$http->post($url,$body);;

        return $response->object();
    }

    public function registerWebhook()
    {
        $body = [
            'url'=> 'https://tourbays.com/tabby-callback', 
            "is_test"=> true,
            "header"=> [
                'title'=> 'Tabby_Callback',
                'value'=> 'Payment_Verify',
            ]
        ];
     
        $http = Http::withToken($this->secret_key)->baseUrl($this->base_url_v1);
       
        $url = 'webhooks';
        $response = $http->post($url,$body);

        return $response->object();
    }

 
    public function cancelRefundPayment($payment_id,$refund_id)
    {
        $http = Http::withToken($this->secret_key)->baseUrl($this->base_url_v1);
        $url = 'payments/'.$payment_id.'/refunds/'.$refund_id;
        $response = $http->delete($url);
        return $response->object();
    }


    public function getConfig($data)
    {
        $body= [];
        $body = [
            "payment" => [
                "amount" => $data['amount'],
                "currency" =>setting_item('currency_main'),
                "description" =>  setting_item("site_title") . " - #" . $data['order_id'],
                "buyer" => [
                    "id" => strval( Auth::user()->id),
                    "phone" => Auth::user()->phone,
                    // "email" => Auth::user()->email,
                    "email" => 'card.success@tabby.ai',

                    "name" => Auth::user()->name,
                    "dob" => Auth::user()->birthday,
                ],
                "shipping_address" => [
                    "city" => Auth::user()->city,
                    "address" =>  Auth::user()->address.','.Auth::user()->address2.','.Auth::user()->country,
                    "zip" => Auth::user()->zip_code,
                ],
                "order" => [
                    "tax_amount" =>  0.00,
                    "shipping_amount" => 0.00,
                    "discount_amount" => 0.00,
                    "updated_at" => now(),
                    "reference_id" => $data['order_id'],
                    "items" => 
                        $data['items'],
                ],
                "buyer_history" => [
                    "registered_since"=> Auth::user()->created_at,
                    "loyalty_level"=> 5,
                    "is_email_verified"=> Auth::user()->email_verified_at != Null ? true : false
                ],
            ],
            "lang" => app()->getLocale(),
            "merchant_code" => "AE",
            "merchant_urls" => [
                "success" => url('tabby/cart-booking?status=1'),
                "cancel" => url('tabby/cart-booking?status=2'),               
                "failure" => url('tabby/cart-booking?status=3'),
            ]
        ];

        return $body;
    }

  
    public function listAllPayments($offset=0)
    {
        $http = Http::withToken($this->secret_key)->get($this->base_url.'/payments?limit=20&offset='.$offset);
        
        $url = 'payments/';

        $response = $http;
        return $response->object();
    }

    public function usedWalletCoins($wallet_total_used,$payment_sessoin_id) {
        
        $payment_deopist = new DepositPayment();
        $payment_deopist->object_model = 'wallet_deposit';
        $payment_deopist->object_id = Auth::user()->id;
        $payment_deopist->payment_gateway = 'tabby';
        $payment_deopist->amount = $wallet_total_used;
        $payment_deopist->meta = json_encode([
            'credit'=>$wallet_total_used,
            'deposit_option'=>["name"=>"buy service","amount"=>$wallet_total_used,"debit"=>$wallet_total_used]
        ]);

        $payment_deopist->save();
        // $payment_deopist->markAsCompleted();

        $rand_id = rand();

        $deopist_update['wallet_transaction_id'] = $payment_sessoin_id;
        $deopist_update['id'] = $rand_id;
         DepositPayment::where('code', $payment_deopist->code)->update(['id'=>$rand_id]);
       
       $payment_deopist->markAsCompleted();

        $payment_deopist->update($deopist_update);

        $row = auth()->user();
        $wallet_transation = $row->transactions()->with(['payment','author'])->orderBy('id','desc')->first();
        $wallet_transation->payment_id = $rand_id;
        $wallet_transation->type = 'withdraw';

       $wallet_transation->save();

       \DB::table('user_wallets')
       ->where('id', $wallet_transation->wallet_id)
       ->update(['balance' => Auth()->user()->balance - ($wallet_total_used*2)]);


    }
    
    protected function handleBookingTypeData($request){

        $session_order_ids =  session()->get('bookingItems_'.Auth::user()->id);

        $status = 0;
        $msg = false;

        $payment_sessoin = PaymentSession::where('payment_id', $request->payment_id)->first();
        $order = Booking::whereIn('id', $session_order_ids)->get();
      
        $data = [
            'payment_status'=>$request->status,
        ];

        
       if ( $payment_sessoin){

        $status = 1;

        $payment = $this->retrivePayment($request->payment_id);
        if ($payment->status=='error'){
            $msg = $payment->error;
            // redirct_url

        }else if($payment->status=='CLOSED' || $payment->status=='REJECTED' || $payment->status=='EXPIRED'){
            $order = Booking::whereIn('id', $session_order_ids)->where('customer_id',Auth::user()->id)->get();
            $cart_total = 0;
            $wallet_total_used = 0;

            foreach ($order as $o){
                $cart_total+= $o->pay_now;
                $wallet_total_used+= $o->wallet_total_used;
            }
            $without_tax =  $cart_total;
            $cart_total =  number_format((float) ( $cart_total + ($cart_total * 5)/100 ), 2, '.', '');
            $cart_total -=  $wallet_total_used;

            if ($order && $cart_total==$payment->amount && $request->status==1){
                $update = [
                    'status'=>'paid',
                    'paid'=>$without_tax,
                ];

                if ($wallet_total_used > 0 ){
                    $this->usedWalletCoins($wallet_total_used,$payment_sessoin->id);
                }

                if (isset($payment->captures)){
                    $captures = array_reverse($payment->captures);
                    $data ['capture']=json_encode($payment->captures);
                    foreach ($captures as $capture){
                        $data ['last_capture']=$capture->id;
                        break;
                    }

                }
                $data ['amount'] = $payment->amount;
                $msg = 'Payement & Order process successfully';
                Cart::emptyMyCart();
                $status = 2;

            }else if ($order && $cart_total==$payment->amount && $request->status==3){
                $msg = 'Your payment is rejected.';
                $update = [
                    'status'=>'rejected',
                ];
                $status = 3;

            }else if ($order && $cart_total==$payment->amount && $request->status==2){
                $msg = 'Your payment is Expired/Failed.';
                $update = [
                    'status'=>'failed/canceled',
                ];
                $status = 4;

            }else{
                $msg = 'Your Order record not found.';
            }
            $update['tabby_session_id'] = $payment_sessoin->id;
            $order = Booking::whereIn('id', $session_order_ids)->where('customer_id',Auth::user()->id)->update($update);

           
        }else if (($payment->status == 'SUCCESS' || $payment->status == 'CREATED')  && $request->status==3 ) {
            $msg = 'Payment failed or seesion out. Please try again.';
           
            $status = 5;

        }else {
            //need to capture paymet
             dd('error',$payment);
        }
        
        if ($msg){
            session()->flash('status', $msg);
        }
        $payment_sessoin->update($data);
        
        }
       return $status;
    
    }
    public function updateTabbyPayment($request){
        $status = 0;
        $session_order_ids =  session()->get('bookingItems_'.Auth::user()->id);
        if (session()->get('modal_type_'.Auth::user()->id)=='Booking'){
           $status =  $this->handleBookingTypeData($request);
        }elseif (session()->get('modal_type_'.Auth::user()->id)=='DepositPayment'){
           
            $status =  $this->handleCreditTypeData($request);
        }else{
            session()->flash('status', 'Your seesion out. payement status is under prcess contact us for manual verifaction' );
        }
        return $status;
      
    }
    protected function handleCreditTypeData($request){

        $session_order_ids =  session()->get('bookingItems_'.Auth::user()->id);
        $status = 0;
        $msg = false;
        $payment_sessoin = PaymentSession::where('payment_id', $request->payment_id)->first();

        $data = [
            'payment_status'=>$request->status,
        ];

       if ( $payment_sessoin){

        $status = 1;

        $payment = $this->retrivePayment($request->payment_id);
        if ($payment->status=='error'){
            $msg = $payment->error;
            // redirct_url

        }else if($payment->status=='CLOSED' || $payment->status=='REJECTED' || $payment->status=='EXPIRED'){
            $rand_id =rand();
            $order = DepositPayment::where('code', $session_order_ids)->update(['id'=>$rand_id]);
            // $order = Transaction::where('code', $session_order_ids)->update(['id'=>$rand_id]);

            $order = DepositPayment::where('code', $session_order_ids)->first();
            

            if ($order && $order->amount==$payment->amount && $request->status==1){
                $update = [
                    'status'=>'completed',
                ];

                $order->markAsCompleted();
                
                if (isset($payment->captures)){
                    $captures = array_reverse($payment->captures);
                    $data ['capture']=json_encode($payment->captures);
                    foreach ($captures as $capture){
                        $data ['last_capture']=$capture->id;
                        break;
                    }

                }
                $data ['amount'] = $payment->amount;
                $msg = 'Credits added successfully';
                $status = 2;

            }else if ($order && $order->amount==$payment->amount && $request->status==3){
                $msg = 'Your payment is rejected.';
                $update = [
                    'status'=>'rejected',
                ];
                $status = 3;

            }else if ($order && $order->amount==$payment->amount && $request->status==2){
                $msg = 'Your payment is Expired/Failed.';
                $update = [
                    'status'=>'failed/canceled',
                ];
                $status = 4;

            }else{
                $msg = 'Your Order record not found.';
            }
            $update['wallet_transaction_id'] = $payment_sessoin->id;
            $order->update($update);
            $row = auth()->user();
            $wallet_transation = $row->transactions()->with(['payment','author'])->orderBy('id','desc')->first();
            $wallet_transation->payment_id = $rand_id;
            $wallet_transation->save();

        }else if (($payment->status == 'SUCCESS' || $payment->status == 'CREATED')  && $request->status==3 ) {
            $msg = 'Payment failed or seesion out. Please try again.';
            $status = 5;
        }else {
            //need to capture paymet
             dd('error',$payment);
        }
        
        if ($msg){
            session()->flash('status', $msg);
        }
        $payment_sessoin->update($data);
        
        }
       return $status;
    }

}
