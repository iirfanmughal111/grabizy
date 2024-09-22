<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Message extends Model
{
    use HasFactory;

    public $table = 'messages';
    public $dates = [
        'created_at',
        'updated_at',
    ];
    public $fillable=[
        'read_at',
        'reply_to',
        'reply_for',
        'name',
        'email',
        'subject',
        'message',
        'user_id',
    ];

    public function User()
    {
        return $this->belongsTo(User::class);
    }
}
