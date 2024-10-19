<div id="variantCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
    <div class="carousel-inner">
        @for($varient = 0 ; $varient < count($product->cjProductVarients) ;$varient+=0)
            @php
            if ($varient >= count($product->cjProductVarients)) break;
            $productVarient = $product->cjProductVarients[$varient];
            $varient++;
            @endphp
            <div class="carousel-item {{ $varient < 3 ? 'active' : '' }}">
                <div class="row mx-5">
                    <div class="col-2 {{ $varient  }}">
                        <img src="{{ $productVarient->variantImage }}" title=" {{ $productVarient->variantNameEn  ? $productVarient->variantNameEn.' - ' : $product->title}} {{  $productVarient->variantKey }}" data-vid="{{  $productVarient->vid }}" class="img-fluid varients " alt="{{  $productVarient->variantKey }}">

                    </div>
                    @php
                    if ($varient >= count($product->cjProductVarients)) break;
                    $productVarient = $product->cjProductVarients[$varient];
                    $varient++;
                    @endphp

                    <div class="col-2 {{ $varient  }}">
                        <img src="{{ $productVarient->variantImage }}" title=" {{ $productVarient->variantNameEn  ? $productVarient->variantNameEn.' - ' :  $product->title}} {{  $productVarient->variantKey }}" data-vid="{{  $productVarient->vid }}" class="img-fluid varients " alt="{{  $productVarient->variantKey }}">

                    </div>
                    @php
                    if ($varient >= count($product->cjProductVarients)) break;
                    $productVarient = $product->cjProductVarients[$varient];
                    $varient++;
                    @endphp
                    <div class="col-2 {{ $varient  }}">
                        <img src="{{ $productVarient->variantImage }}" title=" {{ $productVarient->variantNameEn  ? $productVarient->variantNameEn.' - ' :  $product->title}} {{  $productVarient->variantKey }}" data-vid="{{  $productVarient->vid }}" class="img-fluid varients " alt="{{  $productVarient->variantKey }}">
                    </div>
                    @php
                    if ($varient >= count($product->cjProductVarients)) break;
                    $productVarient = $product->cjProductVarients[$varient];
                    $varient++;
                    @endphp
                    <div class="col-2 {{ $varient  }}">
                        <img src="{{ $productVarient->variantImage }}" title=" {{ $productVarient->variantNameEn  ? $productVarient->variantNameEn.' - ' :  $product->title}} {{  $productVarient->variantKey }}" data-vid="{{  $productVarient->vid }}" class="img-fluid varients " alt="{{  $productVarient->variantKey }}">
                    </div>
                    @php
                    if ($varient >= count($product->cjProductVarients)) break;
                    $productVarient = $product->cjProductVarients[$varient];
                    $varient++;
                    @endphp
                    <div class="col-2 {{ $varient  }}">
                        <img src="{{ $productVarient->variantImage }}" title=" {{ $productVarient->variantNameEn  ? $productVarient->variantNameEn.' - ' :  $product->title}} {{  $productVarient->variantKey }}" data-vid="{{  $productVarient->vid }}" class="img-fluid varients " alt="{{  $productVarient->variantKey }}">
                    </div>
                    @php
                    if ($varient >= count($product->cjProductVarients)) break;
                    $productVarient = $product->cjProductVarients[$varient];
                    $varient++;
                    @endphp
                    <div class="col-2 {{ $varient  }}">
                        <img src="{{ $productVarient->variantImage }}" title=" {{ $productVarient->variantNameEn  ? $productVarient->variantNameEn.' - ' :  $product->title}} {{  $productVarient->variantKey }}" data-vid="{{  $productVarient->vid }}" class="img-fluid varients " alt="{{  $productVarient->variantKey }}">
                    </div>
                </div>
            </div>
            @endfor

</div>
</div>

    <!-- Control buttons -->
    <a class="carousel-control-prev" href="#variantCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#variantCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
  </div>
