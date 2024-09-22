<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;
    protected $table = 'payment_methods';
    public $dates = [
        'created_at',
        'updated_at',

    ];

    protected $fillable = [
        'type',
        'is_active',
    ];
}
