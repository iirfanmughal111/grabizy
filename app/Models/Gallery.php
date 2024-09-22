<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;



class Gallery extends Model
{
    use HasFactory;
    protected $table = 'gallery';
    public $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'value',
        'product_id',
        'is_active',
    ];

    public function gallery_image()
    {
        if (file_exists( public_path() . '/uploads/products/gallery_images/'.$this->value)) {
            return '/uploads/products/gallery_images/' . $this->value;
        } else {
            return '/no-image.png';
        }
    }
    

}
