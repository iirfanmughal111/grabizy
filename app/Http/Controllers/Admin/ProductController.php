<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Category;
use App\Models\Cart;
use App\Models\Gallery;
use App\Models\WishList;
use App\Models\Tag;
use App\Models\Order;
use App\Models\Auction;
use App\Models\Bidding;
use  App\Models\OrderItem;

use App\Http\Controllers\Controller;
use Session;
use Config;
use File;


use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    protected $per_page;

    public function __construct()
    {
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
        $this->featured_path = public_path('/uploads/products/featured_images');
    	$this->gallery_path = public_path('/uploads/products/gallery_images');
    }
    public function productIndex(Request $request){
        
        check_permission_access('listing product');   

            $filters = array();
            $query = Product::where('title', '!=', '');
            if (isset($request->title)){
                $title = $request->title;
                $query = Product::where('title', 'LIKE', '%' . $title . '%');
                $filters['title'] = $request->title;

            }
            if (isset($request->category) && $request->category!= '0'){
                if ($request->category=='null'){
                    $query->where('category_id',null);
                }
                else{
                    $query->where('category_id',$request->category);
                    $filters['category'] = $request->category;
                }
            }
            if (isset($request->visibility) && $request->visibility != 'null'){
                $query->where('is_visible',$request->visibility);
                $filters['visibility'] = $request->visibility;

            }
            if (isset($request->visibility) || isset($request->category) || isset($request->title)){
            $products= $query->orderBy('disp_order', 'desc')->paginate($this->per_page);

            }
            else{
                $products= Product::orderBy('disp_order', 'desc')->paginate($this->per_page);
            }

        $categories = Category::where('is_active',1)->get();

        return view('admin.product.product',compact('products','categories','filters'));
    }


    public function productCreate(request $req){

     
            check_permission_access('add product');   
            $categories = Category::where('is_active',1)->get();

        return view('admin.product.createProductForm', compact('categories'));
    }
     
    
        
        public function productSave(Request $request){
    
            $msg = 'something went wrong';
        check_permission_access('add product');  
        check_permission_access('edit product');   
                $id =1;
                if ($request->prodId=='null'){
                    $lastProd = Product::latest()->first();
                if ($lastProd){
                    $id = $lastProd->id;
                    $id++;
                }
            }   else{
                    $id =$request->prodId;
                }
                $newProd = [];
                $newProd['title'] = trim($request->title);
                $newProd['disp_order'] = time();
                $newProd['short_description'] = trim($request->short_description);
                $newProd['category_id'] = $request->category;
                $newProd['sale_price'] = $request->salePrice;
                $newProd['regular_price'] = $request->regularPrice;
                $newProd['is_visible']  =  ($request->visibility=='on' ? 1: 0);
                $newProd['weight'] = trim($request->weight);

                $tags = explode (",", trim($request->tags)); 
                $newProd['description'] = trim($request->description);
                if (isset($request->featured_image)){
                $image = $request->file('featured_image');
                }else{
                    $image = null;
                    $newProd['featured_image'] = $request->old_image;
                }
              
                if (isset($request->gallery)){
                    $gallery = $request->file('gallery');

                    }else{
                        $gallery = null;
                       
                    }
                    $validation = [
                        'title' => ['required', 'string', 'max:255'],
                        'featured_image' => 'image|mimes:jpeg,png,jpg|max:2048',
                        'regularPrice' => 'required|integer',
                    ];

                    if (isset($request->salePrice)){
                        $validation['regularPrice'] = 'required|integer|gt:salePrice';
                        
                        $validation['salePrice'] =  'integer';
                    }
               
                $request->validate($validation);

                if($image){
                    $newProd['featured_image'] = $id.'_'.rand() . '_featured_image.' . $image->getClientOriginalExtension();
                    //CREATE Featued  FOLDER IF NOT 
                    if (!is_dir($this->featured_path)) {
                        mkdir($this->featured_path, 0777);
                    }
                    $imageResult = $image->move($this->featured_path,  $newProd['featured_image']);
                }
                if($gallery){
                    $this->uploadGalleryImages($gallery,$id);
                }
              
                if ($request->prodId=='null'){
                $prod = Product::create($newProd);
                $msg = 'Product  Added successfully';
                }
                else {
                $prod = Product::whereId($request->prodId)->first();
                if ($prod){
                    $prod->update($newProd);
                    if( (isset($request->old_image)) && $image){
                        if (file_exists($this->featured_path.'/'.$request->old_image)){
                            unlink($this->featured_path.'/'.$request->old_image);
                        }
                    }
                   
                    $msg = 'Product updated successfully.';

                }
                else{
                    $msg = 'Product record not found'.$request->prodId;
                }

                }
                $this->createTags($tags,$id);

                return redirect('admin/product')->with('status',$msg);

        }
        public function createGallery($images,$product_id){
                if(!empty($images) && count($images)>0 && !empty($product_id)){
                    foreach ($images as $key => $image) {
                        if(!empty(trim($image))){
                            $data = array();
                            $data['product_id'] = $product_id;
                            $data['value'] = trim($image);
                            Gallery::create($data);
                        }
                    }
                }
                return true;
            }

            public function uploadGalleryImages($gallery,$id){
                $imageSet = [];
                foreach ($gallery as $key=>$file) {
                    //get filename with extension
                    $fileName = $id.'_'.rand() . '_gallery_image.' . $file->getClientOriginalExtension();
                   //CREATE Gallery FOLDER IF NOT 
                if (!is_dir($this->gallery_path)) {
                    mkdir($this->gallery_path, 0777,true);
                }
                $fileResult = $file->move($this->gallery_path,  $fileName);
                $imageSet[] = $fileName;

                }

                $this->createGallery($imageSet,$id);
                return true;
            }
            public function createTags($tags,$product_id){
                if(!empty($tags) && count($tags)>0 && !empty($product_id)){
                    $oldTags = Tag::where('product_id', $product_id)->delete();
                    foreach ($tags as $key => $tag) {
                        if(!empty(trim($tag))){
                            $data = array();
                            $data['product_id'] = $product_id;
                            $data['value'] = trim($tag);
                            Tag::create($data);
                        }
                    }
                }

                return true;

            }


        function editProduct(request $req){
        check_permission_access('edit product');   

            $prod = Product::whereId($req->id)->first();
            $categories = Category::where('is_active',1)->get();
            if ($prod){

        return view('admin.product.createProductForm',compact('prod','categories'));
            }else{
        return view('admin.product.createProductForm',compact('prod','categories'))->with('status','No data found ');
                
            }
    
        }

        public function deleteImage(Request $request){
            check_permission_access('edit product');   

               
                $data = [];
                $data['success'] = false;
                $data['msg'] = 'An error occured while deleting image from storage.';
                if($request->imageType=='featured'){
                    $image_path = $this->featured_path.'/'.$request->imageId;  // Value is not URL but directory file path
                    if(File::exists($image_path)) {
                        File::delete($image_path);
                    }
                    $prod = Product::whereId($request->prodId)->first();
                    if($prod)
                    $prod->update(['featured_image'=>null]);
                    $data['success'] = true;
                     $data['msg'] = 'Image deleted successfully from  storage.';
                }   
                 else if($request->imageType=='gallery'){
                        $image_path = $this->gallery_path.'/'.$request->imageId;  
                         if(File::exists($image_path)) {
                        File::delete($image_path);
                                 }
                        $prod = Gallery::where('product_id',$request->prodId)->where('value',$request->imageId)->first();
                        if ($prod){
                        $prod->delete();
                        $data['success'] = true;
                        $data['msg'] = 'Image deleted successfully from gallery  storage.';
                        }
                        
                        }
               return $data;


        }

                public function productVisibility(Request $request){
                    check_permission_access('edit product');   

                    if($request->ajax()){
                        $data = [];
                        $product = Product::whereId($request->product_id)->first();
                        if ($product){
                            $data =array();
                            $data['is_visible'] =  $request->status;
                            $product->update($data);
                            // Show message on the basis of status 
                            $data['msg'] = 'Product Visbility updated successfully';
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
        public function productDelete(Request $request){
            check_permission_access('delete product'); 
            $data = [];
            $data['msg'] = 'Something went wrong!!!';  
            $data['success'] = false;
            $deleteProduct = Product::findOrFail($request->prodId);
            if ($deleteProduct){
            $auctions = Auction::where('product_id',$request->prodId)->get();
            foreach($auctions as $auction){
                Bidding::where('auction_id',$auction->auction_id)->delete();
                $auction->delete();
            }
                OrderItem::where('product_id',$request->prodId)->delete();
            
            Cart::where('product_id',$request->prodId)->delete();
            Tag::where('product_id',$request->prodId)->delete();

            WishList::where('product_id',$request->prodId)->delete();
            $gallery = Gallery::where('product_id',$request->prodId)->get();
            foreach($gallery as $image){
                if (file_exists($this->gallery_path.'/'.$image->value)){
                    unlink($this->gallery_path.'/'.$image->value);
                }
                $image->delete();
            }

            if (isset($deleteProduct->featured_image) && file_exists($this->featured_path.'/'.$deleteProduct->featured_image)){
                unlink($this->featured_path.'/'.$deleteProduct->featured_image);
            }
               $deleteProduct->delete();
                $data['success'] = true;

               $data['msg'] = 'Product deleted successfully';
            }
            
            return $data;
    
        }


         
}