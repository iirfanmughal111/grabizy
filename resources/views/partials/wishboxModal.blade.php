<style>

    .wishbox {
        width: 290px;
        height: 50px;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0px 12px 45px rgba(0, 0, 0, .15);
        margin: 0 0 10px 0;
        overflow: hidden;
        opacity: 0;
    }
    .wishbox.open {
        height: 450px;
        opacity: 1;
    }
    .wishbox.popup-ani {
        -webkit-transition: all .8s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transition: all .8s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }
    /* .wishbox h1 {
        font-size: 20px;
        color: #757575;
        padding: 25px 0;
        margin: 0;
    font-weight:400;
    font-family: 'Roboto', sans-serif;

    } */
    /* .wishbox .love {
        width: 20px;
        height: 20px;
        background-position: 35px 84px;
        display: inline-block;
        margin: 0 6px;
        background-size: 62px;
    } */
    /* .wishbox .box-logo {
        width: 65px;
        height: 25px;
        background-position: 0px;
        margin: 0 auto;
        opacity: .5;
        cursor: pointer;
    } */
    /* .wishbox .box-logo:hover {
        opacity: 1;
    } */
    /* .logo-ani {
        transition: 0.5s linear;
        -webkit-transition: 0.5s linear;
    } */

    /* .wishbox .img {
        background-image: url("https://4.bp.blogspot.com/-1J75Et4_5vc/WAYhWRVuMiI/AAAAAAAAArE/gwa-mdtq0NIqOrlVvpLAqdPTV4VAahMsQCPcB/s1600/barrel-we-love-subscribers-img.png");
    } */
    /* .wishbox-block {
        width: 65px;
        height: 65px;
        background-color: #000;
        border-radius: 30px;
        float: right;
        /* box-shadow: 0px 12px 45px rgba(0, 0, 0, .3);
        z-index: 5;
        position: relative;
    } */
    /* .wishbox-block .img-fab {
        height: 70px;
        width: 70px;
        background-image: url("{{asset('images/wishbox.png')}}");
        background-position: center;
        background-size: contain;
    } */
    .wishbox-block .wrap {
        
        transform: rotate(0deg);
        -webkit-transition: all .15s cubic-bezier(0.15, 0.87, 0.45, 1.23);
        transition: all .15s cubic-bezier(0.15, 0.87, 0.45, 1.23);
    }
    .wrap{
        position: fixed;
        right:41px;
        bottom:41px;
    }
    .wishbox-block .ani {
        transform: rotate(45deg);
        -webkit-transition: all .15s cubic-bezier(0.15, 0.87, 0.45, 1.23);
        transition: all .15s cubic-bezier(0.15, 0.87, 0.45, 1.23);
    }
    .wishbox-block .close {
        background-position: -2px 1px;
        transform: rotate(-45deg);
        float: none;
        /*Bootstrap Overide*/
        opacity: 1;
        /*Bootstrap Overide*/
    }
    .wishbox-wrap {
        position: fixed;
        right: 25px;
        bottom: 25px;
        z-index: 1000;
    }
 
    .site_logo{
        width: 50px;
        height: 50px;
    }

    @keyframes circle-size {
        from {
            width: 100px;
            height: 100px;
        }
        to {
            width: 50px;
            height: auto;
        }
    }


    @keyframes shadow-rotate {
        from {
            transform: translate(-50%, -50%) rotate(0deg);
        }
        to {
            transform: translate(-50%, -50%) rotate(360deg);
        }
    }


    /* Yellow Shadow */
    @-moz-keyframes yellow {
    0%, 100% {
        -moz-box-shadow: 1px 0px 19px 4px #FFD700, inset 0px 0px 10px rgba(255, 255, 255, 0.5);
        box-shadow: 1px 0px 19px 4px #FFD700, inset 0px 0px 10px rgba(255, 255, 255, 0.5); }

    50% {
        -moz-box-shadow: 0px 0px 0px 0px rgba(255, 245, 3, 0), inset 0px 0px 0px rgba(255, 255, 255, 0);
        box-shadow: 0px 0px 0px 0px rgba(255, 245, 3, 0), inset 0px 0px 0px rgba(255, 255, 255, 0); } }

    @-webkit-keyframes yellow {
    0%, 100% {
        -webkit-box-shadow: 1px 0px 19px 4px #FFD700, inset 0px 0px 10px rgba(255, 255, 255, 0.5);
        box-shadow: 1px 0px 19px 4px #FFD700, inset 0px 0px 10px rgba(255, 255, 255, 0.5); }

    50% {
        -webkit-box-shadow: 0px 0px 0px 0px rgba(255, 245, 3, 0), inset 0px 0px 0px rgba(255, 255, 255, 0);
        box-shadow: 0px 0px 0px 0px rgba(255, 245, 3, 0), inset 0px 0px 0px rgba(255, 255, 255, 0); } }

    @-o-keyframes yellow {
    0%, 100% {
        box-shadow: 1px 0px 19px 4px #FFD700, inset 0px 0px 10px rgba(255, 255, 255, 0.5); }

    50% {
        box-shadow: 0px 0px 0px 0px rgba(255, 245, 3, 0), inset 0px 0px 0px rgba(255, 255, 255, 0); } }

    @keyframes yellow {
    0%, 100% {
        box-shadow: 1px 0px 19px 4px #FFD700, inset 0px 0px 10px rgba(255, 255, 255, 0.5); }

    50% {
        box-shadow: 0px 0px 0px 0px rgba(255, 245, 3, 0), inset 0px 0px 0px rgba(255, 255, 255, 0); } }

/* Button */
.wishbox-button {
  text-align: center;
  padding: 10px;q
  text-decoration: none;
  color: #000;
  font-weight: bold;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px ;
  border-radius: 50px ;
 
}


/* Yellow Background */
.yellow {
  text-shadow: 0px 1px 0px #faffc7;
  background-image: -webkit-linear-gradient(top, #fff966, #f3fd80);
  background-image: -moz-linear-gradient(top, #fff966, #f3fd80);
  background-image: -o-linear-gradient(top, #fff966, #f3fd80);
  background-image: linear-gradient(to bottom, #fff966, #f3fd80);
  -webkit-animation: yellow 2s infinite;
  -moz-animation: yellow 2s infinite;
  -o-animation: yellow 2s infinite;
  animation: yellow 2s infinite; }



</style>


<div class="wishbox-wrap">
	<div class="wishbox popup-ani">
    <header>
        <div class="row mt-3">
            <div class="col-6">
                <a href="{{url('dashboard/wishbox')}}" class="nav-link">My wishbox</a>
            </div>
            <div class="col-6">
                <img class="site_logo" src="{{showLogo()}}">
            </div>
        </div>
			
		</header>
		<div class="row">
            <div class="col-11 ms-3">
               
            <form method="post" enctype="multipart/form-data" action="{{url('wishbox-save')}} ">
                @csrf
                <div class="mb-3">
                    <label class="default-input-field custom-input">
                        <input type="text" id="title" required name="title" value="{{old('title') }}"
                            aria-describedby="title" placeholder="&nbsp;" />
                        <span class="default-input-placeholder">Title</span>
                        <span class="default-input-border"></span>
                    </label>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                    <div class="defaul-file-imput">
                        <input type="file" accept="image/*" onchange="showFiles(event)" id="gallery"
                            name="gallery[]" multiple />
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <p class="mb-0 pb-0">Product Description</p>
                    <textarea required class="form-control" name="description"></textarea>
                </div>
                <button type="submit" 
                    class="btn-default btn-primary">{{trans('global.submit')}}</button>
            </form>
            </div>
        </div>
	</div>
	<div class="wishbox-block-btn wish-box-btn12">
    <div class="shadow1"></div>
		<div class="wrap">
    	<a href="#" class="wishbox-button yellow img-fab img"><i class="fa-solid fa-crown"></i></a>

			<div class=""></div>
		</div>
	</div>
</div>
<script>
$(".wishbox-block-btn").click(function() {
	$('.wishbox-block-btn .wrap').toggleClass("ani");
	$('.wishbox').toggleClass("open");
	$('.img-fab.img').toggleClass("close");
});
    </script>