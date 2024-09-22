@extends('admin/master')
@section("headTitle")
Banner
@endsection

@section("bodyContent")
@if(auth()->user()->can('delete banner') )
@endif

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Banner Mangement</div>
                <div class="card-body">
                <div class="col-12 d-flex justify-content-end">                           <!-- Button trigger modal -->
                        @if(auth()->user()->can('add banner') )
                        <a type="button" class="btn-default btn-primary" href="{{url('admin/settings/banner/create')}}">
                            {{trans('global.create_new')}}
                        </a>
                        @endif
                    </div>
                </div>
                    <div class="col-12 px-5">
                        @if(session('status'))
                        <div class="alert alert-success" role="alert">
                            {{session('status')}}
                        </div>
                        @endif
                    </div>
                @if($banners->count())
                <div class="row px-4">
                    @foreach($banners as $banner)
                    <div class="col-md-6 mb-3">
                        <div class="card bg-dark text-white">
                            <span class="badge badge-{{ $banner->is_active ? "primary" : 'danger' }}">{{ $banner->is_active ? "Acitve" : 'Disabled' }}</span>
                            <img src="{{asset('images/banner/'.$banner->image)}}" class="card-img admin-banner-image"  alt="...">
                            <div class="card-img-overlay d-flex justify-content-center align-items-center flex-column">
                                <h5 class="text-center">{{$banner->content_heading}}</h5>
                                <p class="card-text">{{$banner->content_desc}}</p>
                                <a class="btn-default btn-light" href="{{url('admin/settings/banner/create/'.$banner->id)}}">{{$banner->button ? $banner->button. ' - ' : ''}} {{trans('global.edit')}}</a>

                            </div>

                            </div>
                        </div>
                @endforeach
                </div>
            </div>
        </div>
        <!-- /.col-->
    </div>
    <div class="row">
        <div class="col-12 d-flex justify-content-center">
            {{$banners->links()}}
        </div>
    </div>
    @else
    <div class="row d-flex justify-content-center">
        <div class="col-12">
            <p class="text-center"> No Data Found</p>
        </div>
    </div>
    @endif



    @endsection

    @section('additionolJs')

    @endsection