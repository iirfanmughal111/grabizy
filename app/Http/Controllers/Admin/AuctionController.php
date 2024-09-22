<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


use App\Models\Product;
use App\Models\Category;
use App\Models\Auction;
use App\Models\Bidding;


use Session;
use Config;

class AuctionController extends Controller
{

    protected $per_page;

    public function __construct()
    {
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}

    }

    
    public function auctionIndex(Request $request){
            check_permission_access('listing auction');
            $query = Auction::where('product_id', '!=', '');
            // if (isset($request->title)){
            //     $title = $request->title;
            //     $query = Auction::where('title', 'LIKE', '%' . $title . '%');
            // }
            // if (isset($request->category) && $request->category!= '0'){
            //     if ($request->category=='null'){
            //     $query->where('category_id',null);
            //     }
            //     else{
            //     $query->where('category_id',$request->category);

            //     }
                
            // }
            if (isset($request->active) && $request->active != 'null'){
             
               $query->where('is_active',$request->active);
            
            }

        $auctions= $query->orderBy('id', 'desc')->paginate($this->per_page);


        return view('admin.auction.auction',compact('auctions'));
    }


    public function auctionStore(Request $request){
        check_permission_access('add auction');
        check_permission_access('edit auction');


        if ($request->ajax()){
            $data['success']=false;

        $validation = [
            'bid_price' => ['required','integer', 'min:0'],
            'startDate' => ['required','date',],
            'endDate' => ['required','date',],
        ];

        $auctionDetail = [
                        'product_id' => $request->prodId,
                        'is_active' => $request->active,
                        'bid_price' => $request->bid_price,
                        'start_dateTime' => strtotime($request->startDate),
                        'end_dateTime' => strtotime($request->endDate),
                        ];
                        $request->validate($validation);
                        $aucId = $request->aucId;
                        if ($aucId == 'null'){
                            $existedAuction = Auction::where('product_id', $request->prodId)->first();
                            if ($existedAuction){
                                $aucId = $existedAuction->id;
                            }


                        }
                if ($aucId == 'null'){
                    $data['success']=true;
                    $data['msg']='Auction created successfully';
                    $auction = Auction::create($auctionDetail); 
                }
                else{
                    $auctionDetail['id']= $aucId;
                    $auction = Auction::whereId($aucId)->first();
                    if ($auction){
                        $auction->update($auctionDetail); 
                        $data['success']=true;
                        $data['msg']='Auction updated successfully';
                    }
                    else{
                        $data['msg']='Error while updating...';
                    }

                }
                return $data;
            }
            return 'Invalid request';

    }
    public function auctionDelete(Request $request){
check_permission_access('delete auction');


        if($request->ajax()){
            $data = [];
            $auction = Auction::whereId($request->deleteAuctionId)->first();
            if ($auction){
                $auction->delete();
                // Show message on the basis of status 
                $data['msg'] = 'Auction & all its linked data deleted successfully';
                $data['success'] = true;
            }
            else{
                $data['success'] = false;
                $data['msg'] = 'Something went wrong';
            }
            
            return $data;
        }
            return 'invalid request';
    }

    public function auctionBidding(Request $request){
        check_permission_access('edit auction');
        
        if($request->ajax()){
            $data = [];
            $auction = Auction::whereId($request->auction_id)->first();
            if ($auction){
                $data =array();
                $data['is_active'] =  $request->status;
                $auction->update($data);
                // Show message on the basis of status 
                $data['msg'] = 'auction bidding updated successfully';
                $data['success'] = true;
            }
            else{
                $data['success'] = false;
                $data['msg'] = 'Something went wrong';
            }
          
           return $data;
        }
        else{

            return 'invalid request';
        }
        
    }

    public function allBiddings(Request $request){
       
    check_permission_access('listing biddings');
        if ($request->auction_id && $request->auction_title){
            readNotificationById($request->notification);

            $biddings = Bidding::where('auction_id',$request->auction_id)->orderBy('bid_amount','desc')->paginate($this->per_page);
            return view('admin.bidding.bidding',compact('biddings'));
        }

    }


}
