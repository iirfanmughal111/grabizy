<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;
    public $table = 'profile';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'user_id',
        'profile_image',
        'phone',
        'comapny',
        'country',
        'region',
        'city',
        'zip',
        'address_line1',
        'address_line2',
    ];
}
