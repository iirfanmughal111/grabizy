<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    public $table = 'cart';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'product_id',
        'count',
        'user_id',
    ];

    public function Product()
    {
        return $this->belongsTo(Product::class);
    }

  

}
