<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use App\Models\Profile;
use App\Models\Order;
use App\Models\Bidding;



use Illuminate\Database\Eloquent\SoftDeletes;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes; 

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'last_active',
        'is_active',
        'last_ip',
        'password',
        'google_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function Profile(){
        return $this->hasOne(Profile::class);
    }

    public function Order(){
        return $this->hasMany(Order::class);

    }

    public function Bidding(){
        return $this->hasMany(Bidding::class);

    }


    public function scopeActive($query)
    {
        return $query->where('active', 1);
    }

    public function scopeOfName($query, $name)
    {
        return $query->where('name', 'LIKE', '%' . $name . '%');
    }

    public function scopeOfEmail($query, $email)
    {
        return $query->where('email', 'LIKE', '%' . $email . '%');
    }

    function random_light_color() {
        return sprintf('%06X', mt_rand(0, 0xFFFFFF));
    }
    function random_dark_color() {
        $dt = '';
        for($o=1;$o<=3;$o++)
        {
            $dt .= str_pad( dechex( mt_rand( 0, 127 ) ), 2, '0', STR_PAD_LEFT);
        }
        return $dt;
    }
    public function getAvatar($rounded = false,$size = 128)
    {
        // Check if the user has a profile and a profile image
        if (isset($this->Profile) && $this->Profile->profile_image != null) {
            // Check if the profile image exists in the public directory
            $imagePath = public_path('/uploads/user/' . $this->Profile->profile_image);
            if (file_exists($imagePath)) {
                return asset('/uploads/user/' . $this->Profile->profile_image);
            }
        }

        // Fallback to UI Avatars if no profile image exists
        return 'https://ui-avatars.com/api/?background=' . $this->random_dark_color() .
            '&color=' . $this->random_light_color() .
            '&size=' . $size .
            '&bold=true&name=' . $this->name .
            '&rounded='. $rounded;
    }

}
