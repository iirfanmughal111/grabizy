<div id="variantCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
    <div class="carousel-inner">
        @for($varient = 0 ; $varient < count($product->cjProductVarients); )
            <div class="carousel-item {{ $varient < 3 ? 'active' : '' }}">
                <div class="row mx-5">
                    @for($i = 0; $i < 6; $i++)
                        @php
                            if ($varient >= count($product->cjProductVarients)) break;
                            $productVarient = $product->cjProductVarients[$varient];
                            $varient++;  // Move to the next variant
                        @endphp
                        <div class="col-2">
                            <img src="{{ $productVarient->variantImage }}" 
                                 title="{{ $productVarient->variantNameEn ? $productVarient->variantNameEn . ' - ' : $product->title }} {{ $productVarient->variantKey }}"
                                 data-vid="{{ $productVarient->vid }}" 
                                 class="img-fluid varients p-2" 
                                 alt="{{ $productVarient->variantKey }}">
                        </div>
                    @endfor
                </div> <!-- Closing the row div properly -->
            </div> <!-- Closing the carousel-item div properly -->
        @endfor
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



<style>
    #variantCarousel{

    /* Custom CSS for semi-transparent background on the carousel buttons */
    .carousel-control-prev,
    .carousel-control-next {
        background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
        border-radius: 50%; /* Make the background circular */
        width: 40px; /* Set a fixed width for the button */
        height: 40px; /* Set a fixed height for the button */
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 10px;
        transition: background-color 0.3s ease; /* Add a smooth transition */
    }
    
 
    
    .carousel-control-prev:hover,
    .carousel-control-next:hover {
        background-color: rgba(0, 0, 0, 0.7); /* Darken the background on hover */
    }
}

    </style>