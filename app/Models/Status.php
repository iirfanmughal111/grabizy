<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    use HasFactory;
    public $table = 'status';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'value',
        'is_active',
        'message',

       
    ];
}
