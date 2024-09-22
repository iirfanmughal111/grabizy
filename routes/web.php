<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\User\ShopController;
use App\Http\Controllers\User\AuctionController;
use App\Http\Controllers\User\SocialShareController;

use App\Http\Controllers\User\GoogleController;





/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('frontend.landing');
// });

Route::get('/not-found', function () {
    return view('admin.partials.error404');
});
  Route::get('clear', function () {
	
        // \Artisan::call('migrate --path=/database/migrations/2022_11_25_105053_create_webinar_registraions_table.php');
        // \Artisan::call('config:clear');
     \Artisan::call('optimize');
        
        dd('optimize!');
    });

Route::middleware([])->group(function () {
  
    Route::get('/', [ShopController::class,'landing']);
    Route::get('shop', [ShopController::class,'shop']);
    Route::post('shop', [ShopController::class,'shop']);
    Route::get('shop/category/{category_id}/{category_title}', [ShopController::class,'shop']);
    Route::get('shop/view/{product_id}/{product_title}', [ShopController::class,'view']);
    Route::post('shop/add-wish-list', [ShopController::class,'wishList']);
    Route::post('shop/add-to-cart', [ShopController::class,'addToCart']);

    Route::get('auction/{state?}', [AuctionController::class,'auction']);
    Route::post('auction', [AuctionController::class,'auction']);

    Route::get('auction/view/{auction_id}/{auction_title}', [AuctionController::class,'auctionView']);
    Route::get('auction/category/{category_id}/{category_title}', [AuctionController::class,'auction']);

    Route::get('/about-us', [UserController::class,'about']);
    Route::get('/privacy-policy', [UserController::class,'privacyPolicy']);

    Route::get('/contact-us', [UserController::class,'contact']);
    Route::post('/contact-us', [UserController::class,'contactStore']);

    // Login with Google
    
    Route::get('auth/google', [GoogleController::class, 'redirectToGoogle']);
    
    Route::get('auth/google/callback', [GoogleController::class, 'handleGoogleCallback']);


});

Route::middleware(['auth'])->group(function () {

    Route::get('shop/cart', [ShopController::class,'cart']);
    Route::post('shop/cart', [ShopController::class,'cartCoupon']);
    Route::get('shop/cart/check-out', [ShopController::class,'checkOut']);
    Route::post('shop/cart/check-out', [ShopController::class,'orderPlaced']);
    Route::post('shop/update-cart-quantity', [ShopController::class,'updateCart']);
    Route::post('shop/delete-cart-item', [ShopController::class,'deleteCart']);

    Route::get('/dashboard', [UserController::class,'dashboard']);
    Route::get('/dashboard/my-orders/', [UserController::class,'orders']);
    Route::post('/dashboard/my-orders/', [UserController::class,'orders']);

    Route::get('/dashboard/profile', [UserController::class,'profile']);
    Route::post('/dashboard/profile', [UserController::class,'profileStore']);
    Route::get('/dashboard/change-password', [UserController::class,'changePassword']);
    Route::post('/dashboard/change-password', [UserController::class,'changePassword']);


    Route::get('/dashboard/wish-list/', [UserController::class,'listWishList']);
    Route::get('/dashboard/auction/biddings/', [UserController::class,'biddingsList']);


    Route::get('/shop/view-order/{order_no}', [ShopController::class,'viewOrder']);
    Route::post('auction/bid/', [AuctionController::class,'bidStore']);

    Route::get('dashboard/wishbox', [WishboxController::class,'actionIndex']);
    Route::post('dashboard/wishbox', [WishboxController::class,'actionIndex']);
    Route::post('/wishbox-save', [WishboxController::class,'saveAction']);
    Route::post('/message-save', [WishboxController::class,'messageSaveAction']);

    Route::post('shop/listingType/grid', [ShopController::class,'listingTypeGrid']);
    Route::post('shop/listingType/list', [ShopController::class,'listingType']);




    
});

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';
