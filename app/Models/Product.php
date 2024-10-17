<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Category;

use App\Models\Gallery;
use App\Models\Tag;
use App\Models\Cart;


class Product extends Model
{
    use HasFactory,SoftDeletes;
    public $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];
    public $fillable=[
        'title',
        'short_description',
        'description',
        'featured_image',
        'prod_gallery'=> 'array',
        'is_visible',
        'weight',
        'sale_price',
        'regular_price',
        'category_id',
        'tags'=> 'array', 
        'shipping_id',
        'sku',
        'disp_order',
        'order_count',
        'cart_count',
        'wishList_count',
        'cj_pId'
    ];

    public function Tags()
    {
        return $this->hasMany(Tag::class);
    }
    public function Category()
    {
        return $this->belongsTo(Category::class);
    }
    public function Gallery()
    {
        return $this->hasMany(Gallery::class);
    }

    public function featured_image()
    {
      if ($this->cj_pId) 
        return $this->featured_image;
    
        if (file_exists( public_path() . '/uploads/products/featured_images/'.$this->featured_image) && isset($this->featured_image)) {
            return '/uploads/products/featured_images/' . $this->featured_image;
        } else {
            return '/no-image.png';
    }     
}

  
}
