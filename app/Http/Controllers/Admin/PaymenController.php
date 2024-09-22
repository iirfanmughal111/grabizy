<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use  App\Models\User;

use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use config;
class PaymenController extends Controller
{
    public function __construct()
    {
        $this->category_path = public_path('/uploads/users');
        $this->per_page = getPerPageItem();
		if ($this->per_page == null){
			$this->per_page  = Config::get('constant.per_page');;
		}
    }

    protected function payment_method(){

    }
}
