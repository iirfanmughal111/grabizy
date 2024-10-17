<?php


namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Session;
use Config;
use File;
use App\Services\CJService;
use Response;
use Carbon\Carbon;
class CategoryController extends Controller
{

    protected $per_page,$category_path;

    public function __construct()
    {
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
		$this->category_path = public_path('/uploads/category');
    }

	public function category(Request $request){
		$cj = new CJService();
        $cj->createCategories();

		check_permission_access('listing categories');
		$query = Category::where('id', '!=', null);
		$filters = array();
		$title = $request->title;
		if (isset($request->title)){
			$query->where('title', 'LIKE', '%' . $title . '%');
			$filters['title'] = $request->title;
		}
		
		if (isset($request->type)){
			if ($request->type == 'active'){
				$query->where('is_active', 1);
			}elseif($request->type == 'trending'){
				$query->where('is_trending', 1);
			}elseif($request->type == 'featured'){
				$query->where('is_featured', 1);
			}
			$filters['type'] = $request->type;
		}
			$query->orderBy('created_at','desc');
			$categories = $query->paginate($this->per_page);
		$trash = false;
        return view('admin.category.category',compact('categories','trash','filters'));	
		
	}


   
	
    public function save(Request $request){
	
		check_permission_access('add categories');
		check_permission_access('edit categories');

		$data = [];
		$cat = null;
		$new_image_name =null;
    	if ($request->ajax()){
            $data['success']=false;
			$validation = [
				'title' => ['required', 'string', 'max:255'],
				'image' => 'image|mimes:jpeg,png,jpg|max:2048',
			];

        	$request->validate($validation);
			$image = $request->file('image');
       	 	$categoryDetail = [
                        'title' => $request->title,
                        'description' => $request->description,
						'is_featured' => $request->is_featured,
						'is_active' => $request->is_active,
						'is_trending' => $request->is_trending,
                        ];	
						

						if($image){
							$categoryDetail['image_url'] = time() . '_category_image.' . $image->getClientOriginalExtension();
					
							//CREATE Category FOLDER IF NOT 
							if (!is_dir($this->category_path)) {
								mkdir($this->category_path, 0777);
							}
							$imageResult = $image->move($this->category_path, $categoryDetail['image_url']);
						if ($imageResult){
						$data['success'] = true;
						$data['msg'] = 'Category created successfully with Image';
	
			}
						}
                if ( $request->catId == 'null'){
                    $data['success']=true;
                    $data['msg']='Category created successfully';
                    $cat = Category::create($categoryDetail); 
                }
                else{
                    $categoryDetail['id']= $request->catId;
                    $cat = Category::whereId($request->catId)->first();
					if (!isset($image)){
						$categoryDetail['image_url'] = $request->imageId;
					}
                    if ($cat){
                  		$cat->update($categoryDetail); 
                        $data['success']=true;
                        $data['msg']='Category updated successfully';
                    }
                    else{
                        $data['msg']="Error while updating...";
                    }
                }
    		return $data;
        }
	}




	public function category_delete(Request $request) {
		
		check_permission_access('delete categories');

		
			if ($request->ajax()) {
			$category  = Category::whereId($request->catId)->first();
				if($category){
					$products = Product::where('category_id',$request->catId)->get();
				 foreach($products as $prod){
					$prod->update(['category_id' => null]);
				 }
					$category->delete();
					$data['success'] = true;	
					$data['msg'] = 'Category deleted successfully';
				}else{
					$data['success'] = false;
					$data['msg'] = 'Error while deleting category';
				}
			
			return $data;
		}else return 'invalid request';		
			
	
	}

	public function category_enalble_disable(Request $request)
	{
		check_permission_access('edit categories');
		if($request->ajax()){
			$data = [];
			$category = Category::whereId($request->category_id)->first();
			if ($category){
				$data =array();
				$data['is_active'] =  $request->status;
				$category->update($data);
				// Show message on the basis of status 
				$data['msg'] = 'Category updated successfully';
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


	public function category_trash(Request $request){
		check_permission_access('listing categories');

			$trash = true;
			$title = $request->title;
			if (isset($request->title)){
			$query = Category::where('title', 'LIKE', '%' . $title . '%');
			}
			else{
					$query = Category::onlyTrashed();
			}
				$categories = $query->orderBy('created_at','desc')->paginate($this->per_page);

        return view('admin.category.categoryTrash',compact('categories','trash'));	

	}


	public function category_restore(Request $request){
		check_permission_access('edit categories');
		if($request->ajax()){
			$data = [];
			$category = Category::whereId($request->restoreCatId)->restore();
			if ($category){
				$data =array();
			//	$data['deleted_at'] =  null;
			//	$category->update($data);
				// Show message on the basis of status 
				$data['msg'] = 'Category restored successfully';
				$data['success'] = true;
			}
			else{
				$data['success'] = false;
				$data['msg'] = 'Something went wrong!!!';
			}
		
		  
		   return $data;
		}
		else{

			return 'invalid request';
		}

}


public function category_delete_permanent(Request $request) {
		
	check_permission_access('delete categories');

		if ($request->ajax()) {
		//	$catImage = Category::whereId($request->catId)->onlyTrashed()->firts();
			$category  = Category::whereId($request->catId)->onlyTrashed()->first();
			if($category){
				 $products = Product::where('category_id',$request->catId)->get();
				 foreach($products as $prod){
					$prod->update(['category_id' => null]);
				 }
				$image_path = $this->category_path.'/'.$category->image_url;
                    if(File::exists($image_path)) {
                        File::delete($image_path);
                    }
				$category->forceDelete();
				
			//	$category->delete();
				$data['success'] = true;	
				$data['msg'] = 'Category deleted successfully';
			}else{
				$data['success'] = false;
				$data['msg'] = 'Error while deleting category';
			}
		
		return $data;
	}else return 'invalid request';		

}


}