<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Auction;


class Bidding extends Model
{
    use HasFactory;
    public $table = 'biddings';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'auction_id',
        'user_id',
        'bid_amount',
    ];

    public function User(){
        return $this->belongsTo(User::class);
    }
    public function Auction(){
        return $this->belongsTo(Auction::class);
    }

 
}
