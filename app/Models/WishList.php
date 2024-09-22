<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Product;


class WishList extends Model
{
    use HasFactory;
    public $table = 'wish_list';

    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'product_id',
        'user_id',
    ];

    public function User()
    {
        return $this->belongsTo(User::class);
    }
    public function Product()
    {
        return $this->belongsTo(Product::class);
    }
}

