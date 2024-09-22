<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use App\Models\Product;

class OrderItem extends Model
{
    use HasFactory,Notifiable, SoftDeletes;
    protected $fillable = [
        'order_id',
        'product_id',
        'quantity',

    ];
    public $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];
    public function Product()
    {
        return $this->belongsTo(Product::class);
    }

}
