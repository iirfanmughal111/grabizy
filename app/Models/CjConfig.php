<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CjConfig extends Model
{
    use HasFactory;
    protected $table = 'cj_config';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'email',
        'password',
        'api',
        'token',
        'token_expiry',
        'refreshToken', 
        'refreshToken_expiry', 
        'base_url', 
        'exchangerate_url',
        'exchangerate_api'
    ];
}
