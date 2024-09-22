@extends('frontend/common/master')
@section("headTitle")
Register
@endsection

@section("bodyContent")
<div class="row">
    {{$errors}}
    <div class="col-md-8 col-10">
        <form method="post" action="{{url('register')}}">
@csrf
            <div class="mb-3">
                    <label for="InputName" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>

            <div class="mb-3">
                <label for="InputEmailAddress" class="form-label">Email address</label>
                <input type="email" class="form-control" name="email" id="email" >
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <label for="Password" class="form-label"> Password</label>
            <div class="input-group mb-3">
                <input type="password" name="password"  id="password-field" class="form-control">
                    <span toggle="#password-field" style="line-height:unset" class="input-group-text fa fa-eye field-icon toggle-password"></span>
                </div>
                <label for="password-confirm" class="form-label"> password Confirm</label>

                <div class="input-group mb-3">
                <input type="password" 
                id="password_confirmation"  name="password_confirmation" class="form-control">
                    
                </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div><script>

$(".toggle-password").click(function() {

$(this).toggleClass("fa-eye fa-eye-slash");
var input = $($(this).attr("toggle"));
if (input.attr("type") == "password") {
  input.attr("type", "text");
} else {
  input.attr("type", "password");
}
});

$(".toggle-password-confirm").click(function() {

$(this).toggleClass("fa-eye fa-eye-slash");
var input = $($(this).attr("toggle"));
if (input.attr("type") == "password") {
  input.attr("type", "text");
} else {
  input.attr("type", "password");
}
});
</script>
@endsection

