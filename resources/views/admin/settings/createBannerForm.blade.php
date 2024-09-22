@extends('admin/master')
@section("headTitle")
banner
@endsection

@section("bodyContent")
@php 
if (isset($banner))
$title = 'Edit banner';
else
$title = 'Create banner';
@endphp

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">{{$title}}</div>
                <div class="card-body">
                    <div class="row ">
                    <div class="col-12 d-flex justify-content-start">                           <!-- Button trigger modal -->
                        @if(auth()->user()->can('delete banner') && $banner)
                        <a type="button" class="btn-default btn-danger" href="{{url('admin/settings/banner/delete/'.$banner->id)}}">
                            {{trans('global.delete')}}
                        </a>
                        @endif
                    </div>
                </div>
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
                            <form method="post" enctype="multipart/form-data" action="{{url('admin/settings/banner')}}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6">                                 
                                    @if ($banner && $banner->image)
                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                <input type='file' id="profile_image"
                                            name="image" onchange="loadFile(event)"  accept=".png, .jpg, .jpeg" />
                                                    <label for="profile_image"><i class="fa-solid fa-pencil"></i></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url({{ file_exists(public_path('images/banner/'.$banner->image)) ? asset('images/banner/'.$banner->image) : asset('/no-image.png') }});">
                                                    </div>
                                                </div>
                                                <a href="{{asset('images/banner/'.$banner->image)}}" class="btn btn-light " download="{{$banner->image}}"><i class="fa-solid  fa-cloud-arrow-down"></i></a>
                                            </div>
                                        <input type="hidden" name="old_image"
                                            value="{{$banner->image}}" />
                                            <img id="outputImage" class="d-none table-image" />
                                            @else

                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                <input type='file' id="profile_image"
                                                name="image" onchange="loadFile(event)"  accept=".png, .jpg, .jpeg" />
                                                    <label for="profile_image"><i class="fa-solid fa-pencil"></i></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url({{ asset('/no-image.png') }});">
                                                </div>                                           
                                                   
                                                </div>
                                            </div>

                                        @endif
                                        </div>

                                        <div class="col-md-6">
                                        <label class="default-input-field custom-input">
                                                <input type="text" id="content_heading"
                                                    value="{{ $banner->content_heading  ?? old('content_heading') }}" name="content_heading"
                                                    aria-describedby="content_heading" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Content heading</span>
                                                <span class="default-input-border"></span>
                                            </label>


                                            <label class="default-input-field custom-input">
                                                <input type="text" id="content_description"
                                                    value="{{ $banner->content_desc  ?? old('content_description') }}" name="content_description"
                                                    aria-describedby="content_description" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Content description</span>
                                                <span class="default-input-border"></span>
                                            </label>
                                       

                                            <label class="default-input-field custom-input">
                                                <input type="text" id="button_text"
                                                    value="{{ $banner->button_text  ?? old('button_text') }}" name="button_text"
                                                    aria-describedby="button_text" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Buttong Text</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                        <label class="default-input-field custom-input">
                                                <input type="text" id="button_link"
                                                    value="{{ $banner->button  ?? old('button_link') }}" name="button_link"
                                                    aria-describedby="button_link" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Buttong Link</span>
                                                <span class="default-input-border"></span>
                                            </label>

                                            <div class="mb-3">
                                            <p class="mb-0 pt-0 text-small">Status</p>
                                            <div class="toggle">
                                                
                                                <input type="checkbox" class="switch_statusEmail"
                                                    {{ $banner && $banner->is_active==1 ? 'checked' : '' }} type="checkbox"
                                                    name="status"  />
                                               
                                                <label></label>
                                            </div>
                                        </div>
                                    </div>
                                       
                                </div>

                                      
                                <input type="hidden" name="banner_id"
                                            value="{{$banner ? $banner->id : 'null' }}" />
                                                      
                                  

                                <button type="submit" id="addEditbannerFormBtn"
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

    
   
    @endsection