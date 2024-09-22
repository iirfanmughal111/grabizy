<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    use HasFactory;
    public $table = 'shippings';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'country',
        'region',
        'cost',
        'weight_from',
        'weight_to',
        'is_active',
    ];

   
}
