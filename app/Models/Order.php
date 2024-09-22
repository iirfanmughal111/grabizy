<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use App\Models\OrderItem;
use App\Models\User;
use App\Models\Status;



class Order extends Model
{
    use HasFactory, Notifiable, SoftDeletes;

    protected $fillable = [
        'user_id',
        'status_id',
        'shipping_cost',
        'note',
        'payment_method',
        'order_no',
        'order_payment',
        'payment_id',

    ];
    public $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public function OrderItem()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function User()
    {
        return $this->belongsTo(User::class);
    }

    public function Status()
    {
        return $this->belongsTo(Status::class);
    }


}
