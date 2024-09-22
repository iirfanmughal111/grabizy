@extends('admin/master')
@section("headTitle")
Product
@endsection

@section("bodyContent")
@php 
if (isset($prod))
$title = 'Edit Product';
else
$title = 'Create Product';
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
                                <a type="button" href="{{url('admin/product')}}" class=" btn-default btn-danger"
                                    data-bs-dismiss="modal">Cancel</a>

                            </div>
                        </div>
                        <div class="col-12 ">

                            <form method="post" enctype="multipart/form-data" action="{{url('admin/product/save')}} "
                                id="addEditProductForm">
                                @csrf
                                <div class=" mb-3">
                                    <label class="default-input-field custom-input">
                                        <input type="text" id="title" name="title" value="{{ $prod->title  ?? old('title') }}"
                                            aria-describedby="title" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Title</span>
                                        <span class="default-input-border"></span>
                                    </label>

                                    <label class="default-input-field custom-input">
                                        <input type="text" id="short_description"
                                            value="{{ $prod->short_description  ?? old('short_description') }}" name="short_description"
                                            aria-describedby="short_description" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Short Description</span>
                                        <span class="default-input-border"></span>
                                    </label>
                                </div>


                                <div class="row mb-3">
                                    <div class="col-md-6">

                                        <label for="category" class="form-label">Category</label>
                                        <select class="selectpicker" name="category" id="category"
                                            aria-label="Default select example" data-live-search="true">
                                            @if (isset($prod))
                                            @foreach($categories as $cat)

                                            <option {{$cat->id==$prod->category_id ? 'Selected' : ''}}
                                                value="{{$cat->id}}">{{$cat->title}}</option>
                                            @endforeach
                                            @else
                                            @foreach($categories as $cat)
                                            <option value="{{$cat->id}}" {{ old('category') == $cat->id ? "selected" :""}} >{{$cat->title}}</option>
                                            @endforeach
                                            @endif

                                        </select>

                                    </div>
                                    <div class="col-md-6 " style="margin-top: 0.70rem;">
                                        @if (isset($prod))
                                        @php
                                        $tagsArray = [];
                                        foreach ($prod->Tags as $key=>$tag){
                                        array_push($tagsArray, $tag->value);
                                        }
                                        $tags = implode(",", $tagsArray);
                                        @endphp

                                        @endif

                                        <label class="default-input-field custom-input">
                                            <input type="text" id="tags" name="tags" aria-describedby="tags"
                                                value="{{ $tags  ?? old('tags') }}" placeholder="&nbsp;" />
                                            <span class="default-input-placeholder">Comma Separated tags i.e
                                                headphone,earphone</span>
                                            <span class="default-input-border"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <p class="mb-0 pt-0">Visibility</p>
                                            <div class="toggle">
                                                @if (isset($prod))
                                                <input type="checkbox" class="switch_statusProduct"
                                                    {{ $prod->is_visible==1 ? 'checked' : '' }} type="checkbox" id="visibility"
                                                    name="visibility" data-visibility="" />
                                                @else
                                                <input type="checkbox" class="switch_statusProduct" {{ old('visibility') == 'on' ? 'checked' : '' }} type="checkbox"
                                                    id="visibility" name="visibility" data-visibility="" />
                                                @endif

                                                <label></label>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="default-input-field custom-input">
                                                <input type="number" value="{{ $prod->weight  ?? old('weight') }}" min="0"
                                                    id="weight" name="weight" aria-describedby="weight"
                                                    placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Weight (In grams) </span>
                                                <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="default-input-field custom-input">
                                            <input type="number" value="{{ $prod->sale_price  ?? old('salePrice') }}" min="0"
                                                id="salePrice" name="salePrice" aria-describedby="salePrice"
                                                placeholder="&nbsp;" />
                                            <span class="default-input-placeholder">Sale Price </span>
                                            <span class="default-input-border"></span>
                                        </label>

                                    </div>
                                    <div class="col-md-6">
                                        <label class="default-input-field custom-input">
                                            <input type="number" required min="0"
                                                value="{{ $prod->regular_price  ?? old('regularPrice') }}" id="regularPrice"
                                                name="regularPrice" aria-describedby="regularPrice"
                                                placeholder="&nbsp;" />
                                            <span class="default-input-placeholder">Regular Price </span>
                                            <span class="default-input-border"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <p>Product Image</p>
                                        <div class="defaul-file-imput">
                                        <input type="file"  accept="image/*" id="featured_image" name="featured_image"
                                            onchange="loadFile(event)" />
                                        </div>
                                        @if (isset($prod))
                                        <div class="image-area mt-2">
                                            <img class="table-image"
                                                src="{{ file_exists(public_path('uploads/products/featured_images'.$prod->featured_image)) ? asset('no-image.png') : asset('uploads/products/featured_images/'.$prod->featured_image) }}">
                                            <a class="remove-image" data-imageId="{{$prod->featured_image}}"
                                                data-imageType="featured" data-prodId="{{$prod->id}}"
                                                href="javascript:void(0);" style="display: inline;">&#215;</a>
                                        </div>

                                        <input type="hidden" name="old_image" value="{{$prod->featured_image}}" />
                                        @endif
                                    </div>
                                    <div class="col-md-6">
                                        <p>Product Gallery</p>
                                        <div class="defaul-file-imput">

                                        <input type="file" accept="image/*" onchange="showFiles(event)" id="gallery"
                                            name="gallery[]" multiple />
                                        </div>

                                        @if (isset($prod))
                                        @foreach ($prod->Gallery as $image)
                                        <div class="image-area mt-2" id="image-area-{{$prod->id}}">
                                            <img class="table-image"
                                                src="{{ file_exists(public_path('uploads/products/gallery_images'.$image->value)) ? asset('no-image.png') : asset('uploads/products/gallery_images/'.$image->value) }}">
                                            <a class="remove-image" data-imageId="{{$image->value}}"
                                                data-imageType="gallery" data-prodId="{{$prod->id}}"
                                                href="javascript:void(0);" style="display: inline;">&#215;</a>
                                        </div>

                                        <input type="hidden" name="old-gallery[]" value="{{$image->value}}">

                                        @endforeach
                                        @endif

                                    </div>
                                </div>

                                <div class="row mb-3">

                                    <div class="col-md-6">
                                        <img id="outputImage" class="d-none table-image" />
                                    </div>
                                    <div class="col-md-6">
                                        <div class="preview_image">
                                            <!-- It will show the total number of files selected -->
                                            <p class="d-none"><span id="total-prod-images">0</span> File(s) Selected</p>

                                            <!-- All images will display inside this div -->
                                            <div id="show-prod-images"></div>
                                        </div>
                                    </div>
                                </div>



                                <div class="mb-3">
                                    <p class="mb-0 pb-0">Product Description</p>
                                    <textarea class="form-control" placeholder="You can style your product description "
                                        name="description" id="prodDescription">{{$prod->description ?? old('description')}}</textarea>
                                </div>

                                <input type="hidden" class="form-control" value="{{$prod->id ?? 'null'}}" id="prodId"
                                    name="prodId">

                                <button type="submit" id="addEditProdFormBtn"
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

    <script src="{{asset('js/module/product.js')}}"></script>
    <script src="{{asset('tinymce/tinymce.min.js')}}"></script>

    <script>
    tinymce.init({
        selector: 'textarea#prodDescription',
        branding: false,
        plugins: 'quickbars table image link lists media autoresize help',
        toolbar: 'undo redo | formatselect | bold italic | alignleft aligncentre alignright alignjustify | indent outdent | bullist numlist',
        promotion: false
    });
    </script>
    @endsection