<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    protected $fillable = [
        'site_title',
        'site_logo',
        'site_tag_line',
        'send_mail',
        'privacy_policy',
        'items_per_page',
        'prod_per_page',
        'about_page',
        'meta_desc',
        'login_page',
        'register_page',
        'twitter_link',
        'facebook_link',
        'instagram_link',
        'whatsapp_link',
        'shop_address',
        'shop_email',
        'shop_contact',

    ];
    public $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
