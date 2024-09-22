<?php

use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\PermissionsController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ShopController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\AuctionController;
use App\Http\Controllers\Admin\SettingsController;

use App\Http\Controllers\Admin\WishboxController;

use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\VerifyEmailController;
use App\Http\Controllers\Admin\MessageController;


use Illuminate\Support\Facades\Route;

Route::middleware('auth')->group(function () {
    Route::get('get-notifications', [AdminController::class,'userNotifications']);
    Route::post('delete-notification', [AdminController::class,'exitUserNotificationById']);
    Route::post('read-notification', [AdminController::class,'readUserNotificationById']);
    Route::get('notifications', [AdminController::class,'listNotifications']);
    Route::post('notifications/readAll', [AdminController::class,'readNotifications']);
    Route::post('notifications/deleteAll', [AdminController::class,'deleteNotifications']);

});

Route::group([ 'prefix' => 'admin','middleware' => ['auth','adminStaff']],function () {
    
    Route::resources(['roles' => RoleController::class, ]);

    Route::get('/', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::get('/settings', [SettingsController::class, 'indexAction']);
    Route::post('/settings', [SettingsController::class, 'indexActionSave']);

    Route::get('/settings/banner', [SettingsController::class, 'bannerAction']);
    Route::get('/settings/banner/create/{banner_id?}', [SettingsController::class, 'bannerActionCreate']);
    Route::post('/settings/banner', [SettingsController::class, 'bannerActionSave']);
    Route::get('/settings/banner/delete/{banner_id}', [SettingsController::class, 'bannerActionDelete']);





    Route::resources(['permissions' => PermissionsController::class,]);
    Route::Post('permissions/enable-disable',[PermissionsController::class, 'perm_enalble_disable']);
 //   Route::resources(['users' => UserController::class,]);
//  Users
    Route::get('users', [UserController::class, 'index'])->name('users.index');
    Route::post('users', [UserController::class, 'index'])->name('users.indexsSearch');
    Route::post('users/save', [UserController::class, 'store'])->name('users.store');
    Route::post('users/delete', [UserController::class, 'destroy'])->name('users.delete');
    Route::Post('users/enable-disable',[UserController::class, 'user_enalble_disable']);
    Route::get('users/profile/{user_id}',[UserController::class, 'profile']);
    Route::post('users/profile/',[UserController::class, 'profileStore']);
    Route::get('users/trash',[UserController::class, 'user_trash']);
    Route::post('users/restore',[UserController::class, 'user_restore']); 
    Route::post('users/delete-permanent',[UserController::class, 'user_delete_permanent']);
    Route::post('users/location',[UserController::class, 'locationbyIp']); 

    // Route::post('/users/delete/{user_id}', [UserController::class, 'destroy'])->name('user.delete');

//Orders
Route::get('orders',[ShopController::class, 'shop']);
Route::post('orders',[ShopController::class, 'shop']);
Route::post('orders/status',[ShopController::class, 'orderStatusUpdate']);
Route::post('orders/delete',[ShopController::class, 'orderDelete']);

Route::get('orders/trash',[ShopController::class, 'shopTrash']);
Route::post('orders/trash',[ShopController::class, 'shopTrash']);
Route::post('orders/restore',[ShopController::class, 'shopRestore']);


//Order status
Route::get('status',[ShopController::class, 'status']);
Route::get('status/create',[ShopController::class, 'statusAddEdit']);

Route::post('status/save',[ShopController::class, 'statusStore']);
Route::post('status/delete',[ShopController::class, 'statusDelete']);

Route::get('shop/shipping/',[ShopController::class, 'shipping']); 
Route::get('shop/shipping/create/{id?}',[ShopController::class, 'shippingCost']);
Route::post('shop/shipping/create',[ShopController::class, 'shippingCost']); 
Route::post('shop/shipping/delete',[ShopController::class, 'shippingCostDelete']); 



// Route::get('shop/shipping/{id?}',[ShopController::class, 'shippingCost']); 






//Category

	
Route::get('category',[CategoryController::class, 'category']); 
Route::Post('category',[CategoryController::class, 'category']); 
Route::POST('category/save/', [CategoryController::class, 'save']);
Route::POST('category/delete/', [CategoryController::class, 'category_delete']);
Route::Post('category/enable-disable',[CategoryController::class, 'category_enalble_disable']);
Route::get('category/trash',[CategoryController::class, 'category_trash']);
Route::post('category/restore',[CategoryController::class, 'category_restore']); 
Route::post('category/delete-permanent',[CategoryController::class, 'category_delete_permanent']); 


// Route::POST('category/save/image', [CategoryController::class, 'saveImage']);
// Route::get('category/create',[CategoryController::class, 'category_create']); 

// Route::get('category/edit/{category_id}',[CategoryController::class, 'category_edit']); 
// Route::Post('category/update/{category_id}',[CategoryController::class, 'category_update']);
// Route::Post('category/delete/{category_id}',[CategoryController::class, 'category_delete']);

//Products


Route::get('product',[ProductController::class, 'productIndex']); 

Route::Post('product',[ProductController::class, 'productIndex']); 

Route::get('product/create',[ProductController::class, 'productCreate']); 
Route::post('product/save',[ProductController::class, 'productSave']); 
Route::get('product/edit/{id}',[ProductController::class, 'editProduct']); 
Route::post('product/delete/image',[ProductController::class, 'deleteImage']); 
Route::Post('product/visibility',[ProductController::class, 'productVisibility']); 

Route::Post('auction/store',[AuctionController::class, 'auctionStore']); 
Route::Post('auction/bidding',[AuctionController::class, 'auctionBidding']); 
Route::Post('auction/delete',[AuctionController::class, 'auctionDelete']); 


Route::get('auction',[AuctionController::class, 'auctionIndex']); 
Route::post('auction',[AuctionController::class, 'auctionIndex']); 
Route::get('auction/bidding/{auction_id}/{auction_title}',[AuctionController::class, 'allBiddings']); 



Route::post('product/update',[ProductController::class, 'productUpdate']);
Route::post('product/delete',[ProductController::class, 'productDelete']); 

Route::get('messages/{status?}',[MessageController::class, 'messages']); 
Route::post('messages',[MessageController::class, 'messages']); 

Route::post('messages/read',[MessageController::class, 'readMessage']); 

//Wishbox

Route::get('wishbox/',[WishboxController::class, 'actionIndex']); 
Route::post('wishbox/',[WishboxController::class, 'actionIndex']); 
Route::post('/message-save', [WishboxController::class,'messageSaveAction']);


});
