
    <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
				<div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Featured Categories</h4>
                            @php
                                $listing = listCateogories();
                            @endphp
                            <ul>
                            @foreach ($listing as $list)
                                @if (isset($list->title) &&  $list->is_featured)
                                <li><a href="{{url('shop/category/'.$list->id.'/'.str_replace(' ','-',$list->title))}}">{{$list->title}}</a></li>
                                @endif
                            @endforeach
                            </ul>
                        </div>
                    </div>
					<div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="footer-link">
                            <h4>Featured Categories</h4>
</div>
						<div class="footer-top-box">
							
							<p>If you require any information or have any questions about us, please feel free to contact us on following accounts.</p>
							<ul>
                                @if (getSocialLink('facebook_link'))
                                    <li><a target="_blank" href="{{getSocialLink('facebook_link')}}"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                @endif
                                @if (getSocialLink('twitter_link'))
                                    <li><a target="_blank" href="{{getSocialLink('twitter_link')}}"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                @endif
                                @if (getSocialLink('instagram_link'))
                                    <li><a target="_blank" href="{{getSocialLink('instagram_link')}}"><i class="fa-brands fa-instagram"></i></i></a></li>
                                @endif
                                @if (getSocialLink('whatsapp_link'))
                                    <li><a target="_blank" href="{{getSocialLink('whatsapp_link')}}"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                                @endif
                            </ul>
						</div>
					</div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                @if (getStoreEmail())
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>{{getStoreAddress()}}</p>
                                </li>
                                @endif
                                @if (getStoreContact())

                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:{{getStoreContact()}}">{{getStoreContact()}}</a></p>
                                </li>
                                @endif
                                @if (getStoreEmail())

                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:{{getStoreEmail()}}">{{getStoreEmail()}}</a></p>
                                </li>
                                @endif

                            </ul>
                        </div>
                    </div>
				</div>
			
               
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; {{date("Y")}} <a href="#">{{showSiteTitle()}}</a> Developed By :
            <a href="mailto:iirfanmughal111@gmail.com">Muhammad Irfan</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>


<script>


</script>