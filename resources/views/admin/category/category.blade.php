@extends('admin/master')
@section("headTitle")
Category
@endsection

@section("bodyContent")
@if(auth()->user()->can('add categories') || auth()->user()->can('edit categories') )
@include('admin.category.categoryCreateModal')
@include('admin.category.categoryRestoreModal')

@endif
@if(auth()->user()->can('delete categories') )
@include('admin.category.categoryDeleteModal')
@endif

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Categories Mangement</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-12 d-flex justify-content-end">
                            <!-- Button trigger modal -->
                            @if(auth()->user()->can('add categories') )
                            <button type="button" class=" btn-default btn-primary" data-bs-toggle="modal"
                                data-bs-target="#creatCategoryModal">
                                {{trans('global.create_new')}}
                            </button>
                            @endif


                        </div>

                    </div>
                </div>
                @if($categories->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        @include('admin.category.categorySearchForm')
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Active</th>
                                    <th>Featured</th>
                                    <th>Trending</th>
                                    <th>Last update</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                @foreach($categories as $key=>$cat)
                                <tr class="align-middle " id="cat-row-{{$cat->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>
                                    <td>
                                        <img class="table-image"
                                                src="{{ file_exists(public_path('uploads/category/'.$cat->image_url)) ? asset('uploads/category/'.$cat->image_url) : asset('no-image.png') }}">
                                    <td class="text-capitalize">
                                        <div>{{$cat->title}}</div>
                                    </td>
                                    <td class="text-capitalize">
                                        <div>{{ Str::limit($cat->description, 20) }} </div>
                                    </td>
                                    <td>
                                    <div class="toggle">
                                        <input type="checkbox" class="switch_statusCategory" id="switch_statusCategory" data-cat-id="{{$cat->id}}" {{ $cat->is_active==1 ? 'checked' : '' }} id="active" class="toggle" />
                                        <label></label>
                                        </div>
                                    </td>
                                    <td>
                                    
                                    <div class=" {{ $cat->is_featured==1 ? 'fw-semibold' : 'text-danger' }} "> {{ $cat->is_featured==1 ? trans('global.yes') : trans('global.no') }}</div>
                                </td>
                                   
                                    <td>
                                    
                                        <div class=" {{ $cat->is_trending==1 ? 'fw-semibold' : 'text-danger' }} "> {{ $cat->is_trending==1 ? trans('global.yes') : trans('global.no') }}</div>
                                    </td>
                                    <td>      
                                    <div class=""> {{ $cat->updated_at ? date($cat->updated_at) : date($cat->created_at) }}</div>
                                </td>
                                    <td>
                                        @if(auth()->user()->can('add categories') || auth()->user()->can('edit
                                        categories') || auth()->user()->can('delete categories'))
                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                @if(auth()->user()->can('add categories') || auth()->user()->can('edit
                                                categories'))
                                                <a class="dropdown-item changeSelected" href="#" data-bs-toggle="modal"
                                                    data-bs-target="#creatCategoryModal" data-cat="{{$cat}}"
                                                    data-image-id="{{ $cat->image_url }}">{{trans('global.edit')}}</a>
                                                @endif
                                                @if(auth()->user()->can('delete categories'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteCategoryModal" data-cat="{{$cat}}"
                                                    href="#">{{trans('global.delete')}}</a>
                                                @endif

                                            </div>
                                        </div>
                                        @endif

                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-->
    </div>
    <div class="row">
        <div class="col-12 d-flex justify-content-center">
            {{ $categories->links() }}
        </div>
    </div>

    @else
    <div class="row d-flex justify-content-center">
        <div class="col-12">
            <p class="text-center"> No Data Found</p>
        </div>
    </div>
    @endif
    <div id="notification"></div>


    @endsection


    @section('additionolJs')
 

     <script src="{{asset('/js/module/category.js')}}" crossorigin="anonymous"></script> 

    @endsection