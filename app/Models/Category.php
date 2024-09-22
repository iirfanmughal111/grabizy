<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Product;

class Category extends Model
{
    use SoftDeletes;
    protected $table = 'categories';
    public $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];
    public $fillable=[
        'title',
        'description',
        'is_active',
        'is_featured',
        'is_trending',
        'image_url', 
    ];

    public function Product()
    {
        return $this->hasMany(Product::class);
    }

    public function scopeActive($query)
    {
        return $query->where('active', 1);
    }

    public function scopeOfTitle($query, $title)
    {
        return $query->where('title', 'LIKE', '%' . $title . '%');
    }
}
