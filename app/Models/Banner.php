<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    use HasFactory;


    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'image',
        'button',
        'is_active',
        'content_heading',
        'button_text',
        'content_desc',
    ];
}
