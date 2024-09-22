@extends('admin/master')
@section("headTitle")
Settings
@endsection

@section("bodyContent")
@php 
if (isset($settings))
$title = 'Edit Settings';
else
$title = 'Create Settings';
@endphp

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">{{$title}}</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="row">
                            @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif                                                
                            <div class="col-12 d-flex justify-content-end">
                                @if(session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{session('status')}}
                                </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-12 ">
                            <form method="post" enctype="multipart/form-data" action="{{url('admin/settings')}}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6">                                 
                                    @if ($settings && $settings->site_logo)
                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                <input type='file' id="profile_image"
                                            name="site_logo" onchange="loadFile(event)"  accept=".png, .jpg, .jpeg" />
                                                    <label for="profile_image"><i class="fa-solid fa-pencil"></i></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url({{ showLogo() }});">
                                                    </div>
                                                </div>
                                                <a href="{{asset('images/logo/'.$settings->site_logo)}}" class="btn btn-light " download="{{$settings->site_logo}}"><i class="fa-solid  fa-cloud-arrow-down"></i></a>
                                            </div>
                                        <input type="hidden" name="old_logo"
                                            value="{{$settings->site_logo}}" />
                                            <img id="outputImage" class="d-none table-image" />
                                            @else

                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                <input type='file' id="profile_image"
                                            name="site_logo" onchange="loadFile(event)"  accept=".png, .jpg, .jpeg" />
                                                    <label for="profile_image"><i class="fa-solid fa-pencil"></i></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url({{ asset('/no-image.png') }});">
                                                    </div>                                           
                                                   
                                                </div>
                                            </div>
                                        @endif



                                        <label class="default-input-field custom-input">
                                                <input type="number" id="items_per_page"
                                                    value="{{ $settings->items_per_page  ?? old('items_per_page') }}" name="items_per_page"
                                                    aria-describedby="items_per_page" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Items Per Page</span>
                                                <span class="default-input-border"></span>
                                            </label>


                                            <label class="default-input-field custom-input">
                                                <input type="number" id="products_per_page"
                                                    value="{{ $settings->prod_per_page  ?? old('products_per_page') }}" name="products_per_page"
                                                    aria-describedby="products_per_page" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Products Per Page</span>
                                                <span class="default-input-border"></span>
                                            </label>
                                       



                                        <label class="default-input-field custom-input">
                                                <input type="text" id="facebook_link"
                                                    value="{{ $settings->facebook_link  ?? old('facebook_link') }}" name="facebook_link"
                                                    aria-describedby="facebook_link" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Facebook Link</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            <label class="default-input-field custom-input">
                                                <input type="text" id="twitter_link"
                                                    value="{{ $settings->twitter_link  ?? old('twitter_link') }}" name="twitter_link"
                                                    aria-describedby="twitter_link" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Twitter Link</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            <label class="default-input-field custom-input">
                                                <input type="text" id="instagram_link"
                                                    value="{{ $settings->instagram_link  ?? old('instagram_link') }}" name="instagram_link"
                                                    aria-describedby="instagram_link" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Instagram Link</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            <label class="default-input-field custom-input">
                                                <input type="text" id="whatsapp_link"
                                                    value="{{ $settings->whatsapp_link  ?? old('whatsapp_link') }}" name="whatsapp_link"
                                                    aria-describedby="whatsapp_link" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Whatsapp Link</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                    </div>

                                    <div class="col-md-6">
                                        <div class=" mb-3">
                                            <label class="default-input-field custom-input">
                                                <input type="text" id="site_title" name="site_title" value="{{ $settings->site_title  ?? old('site_title') }}"
                                                    aria-describedby="site_title" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Site Title</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            <label class="default-input-field custom-input">
                                                <input type="text" id="site_tagLine"
                                                    value="{{ $settings->site_tag_line  ?? old('site_tagLine') }}" name="site_tagLine"
                                                    aria-describedby="site_tagLine" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Site Tagline</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            </div>

                                      


                                   
                                            <label class="default-input-field custom-input">
                                                <input type="text" id="shop_contact"
                                                    value="{{ $settings->shop_contact  ?? old('shop_contact') }}" name="shop_contact"
                                                    aria-describedby="shop_contact" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Shop Contact</span>
                                                <span class="default-input-border"></span>
                                            </label> 


                                            <label class="default-input-field custom-input">
                                                <input type="text" id="shop_email"
                                                    value="{{ $settings->shop_email  ?? old('shop_email') }}" name="shop_email"
                                                    aria-describedby="shop_email" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Shop Email</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            <label class="default-input-field custom-input">
                                                <input type="text" id="shop_address"
                                                    value="{{ $settings->shop_address  ?? old('shop_address') }}" name="shop_address"
                                                    aria-describedby="shop_address" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Shop Address</span>
                                                <span class="default-input-border"></span>
                                            </label>        


                                      
                                        <div class="mb-3">
                                            <div class="form-floating">
                                            <textarea class="form-control" placeholder="Login Page Content Here" name="login_page" style="height: 100px">{{ $settings ? $settings->login_page  : old('login_page') }}</textarea>
                                            <label for="floatingTextarea2">Login Page Content</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <div class="form-floating">
                                            <textarea class="form-control" placeholder="Register Page Content Here" name="register_page" style="height: 100px">{{ $settings ? $settings->register_page  : old('register_page') }}</textarea>
                                            <label for="floatingTextarea2">Register Page Content</label>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <div class="form-floating">
                                            <textarea class="form-control" placeholder="Meta description" name="meta_desc" style="height: 100px">{{ $settings ? $settings->meta_desc  : old('meta_desc') }}</textarea>
                                            <label for="floatingTextarea2">Meta description</label>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <p class="mb-0 pt-0 text-small">Send mails on order create/update</p>
                                            <div class="toggle">
                                                
                                                <input type="checkbox" class="switch_statusEmail"
                                                    {{ $settings && $settings->send_mail==1 ? 'checked' : '' }} type="checkbox"
                                                    name="send_mail"  />
                                               
                                                <label></label>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <div class="mb-3">
                                    <p class="mb-0 pb-0">About us Page</p>
                                    <textarea class="form-control" placeholder="You can style your page content here"
                                        name="about_page" id="about_page">{{$settings->about_page ?? old('about_page')}}</textarea>
                                </div>
                                                              
                                <div class="mb-3">
                                    <p class="mb-0 pb-0">Privacy Poilcy</p>
                                    <textarea class="form-control" placeholder="You can style your page content here "
                                        name="privacy_policy" id="privacy_policy">{{$settings->privacy_policy ?? old('privacy_policy')}}</textarea>
                                </div>


                                <button type="submit" id="addEditSettingsFormBtn"
                                    class="btn-default btn-primary">{{trans('global.submit')}}</button>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!-- /.col-->
    </div>

    @endsection

    @section('additionolJs')
    <script src="{{asset('tinymce/tinymce.min.js')}}"></script>
    
    <script>
    tinymce.init({
        selector: 'textarea#privacy_policy',
        branding: false,
        plugins: 'quickbars table image link lists media autoresize help',
        toolbar: 'undo redo | formatselect | bold italic | alignleft aligncentre alignright alignjustify | indent outdent | bullist numlist',
        promotion: false
    });

    tinymce.init({
        selector: 'textarea#about_page',
        branding: false,
        plugins: 'quickbars table image link lists media autoresize help',
        toolbar: 'undo redo | formatselect | bold italic | alignleft aligncentre alignright alignjustify | indent outdent | bullist numlist',
        promotion: false
    });
    </script>
    @endsection