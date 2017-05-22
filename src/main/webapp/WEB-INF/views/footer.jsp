<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

 <!--SECTION FOOTER--> 
    <section id="footer-tag">
        <div class="container">
           <div class="col-md-12">
              <div class="col-md-4">
                 <h3>About Us</h3>
                 <p>Thank you for visiting tennisclub.com. Our mission is to 
                 provide unrivalled and unbiased informative and resources to help any sports fan who enjoys a flutter make informed and value led decisions.</p>
                 <p>Our mission is to 
                 provide unrivalled and unbiased informative, resources to help any sports fan who enjoys a flutter make.</p>
              </div>
              <div class="col-md-4 cat-footer">
                <div class="footer-map"></div>
                <h3 class='last-cat'>Last Categories</h3>
                <ul class="last-tips">
                  <li><a href="tournaments.html">Tournaments</a></li>
                  <li><a href="results.html">All Results</a></li>
                  <li><a href="matches.html">Matches London ATP</a></li>
                  <li><a href="matches.html">Double ATP</a></li>
                  <li><a href="matches.html">Double WTP</a></li>
                  <li><a href="shops.html">Shop Best Price</a></li>
                </ul>
              </div>
              <div class="col-md-4 footer-newsletters">
                <h3>Newsletters</h3>
                <form method="post">     
                            <div class="name">
                                <label for="name">* Name:</label><div class="clear"></div>
                                <input id="name" name="name" type="text" placeholder="e.g. Mr. John Doe" required=""/>
                            </div>
                            <div class="email">
                                <label for="email">* Email:</label><div class="clear"></div>
                                <input id="email" name="email" type="text" placeholder="example@domain.com" required=""/>
                            </div>
                            <div id="loader">
                                        <input type="submit" value="Submit"/>
                                    </div>
                </form>
              </div>
              <div class="col-xs-12">
                <ul class="social">
                      <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                      <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                      <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                      <li><a href="#"><i class="fa fa-digg"></i></a></li>
                      <li><a href="#"><i class="fa fa-rss"></i></a></li>
                      <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                      <li><a href="#"><i class="fa fa-tumblr"></i></a></li>

                    </ul>
              </div>
             </div>
           </div>
    </section>
    <footer>
      <div class="col-md-12 content-footer">
		<p>© 2014 - 2015 tennisclub.com. All rights reserved. </p>
      </div>
	</footer>
</section><!--Close Top Container-->




<script type="text/javascript">
    $('#textslide p.creative').transition({ scale: 1, opacity: 1, delay: 1000, duration: 2000 });
    $('#textslide p.linetheme-left').transition({ x: '0px', opacity: 1, delay: 2000, duration: 1500 });
    $('#textslide p.linetheme-right').transition({ x: '0px', opacity: 1, delay: 2000, duration: 1500 });
    $('#textslide .titl-theme').transition({ opacity: 1, delay: 2500, duration: 2000 });
    $('.slide-txt img').transition({ opacity: 1, delay: 1000, duration: 2000 });

</script>
<!--MENU-->
<script src="<%=pathGreenBall%>/resources/js/menu/modernizr.custom.js" type="text/javascript"></script>
<script src="<%=pathGreenBall%>/resources/js/menu/cbpHorizontalMenu.js" type="text/javascript"></script>
<!--END MENU-->
<!--PERCENTAGE-->
<script>
    $(function () {
        "use strict";
        $('.skillbar').each(function () {
            $(this).find('.skillbar-bar').width(0);
        });

        $('.skillbar').each(function () {
            $(this).find('.skillbar-bar').animate({
                width: $(this).attr('data-percent')
            }, 2000);
        });
    });
</script>
<script>
    jQuery(document).ready(function () {
        jQuery('.tabs .tab-links a').on('click', function (e) {
            var currentAttrValue = jQuery(this).attr('href');

            // Show/Hide Tabs
            jQuery('.tabs ' + currentAttrValue).slideDown(400).siblings().slideUp(400);

            // Change/remove current tab to active
            jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

            e.preventDefault();
        });
    });
</script>

<!-- Percentace circolar -->
    <script src="<%=pathGreenBall%>/resources/js/circle/jquery-asPieProgress.js" type="text/javascript"></script>
    <script src="<%=pathGreenBall%>/resources/js/circle/rainbow.min.js" type="text/javascript"></script>

<!--Gallery-->

<script src="<%=pathGreenBall%>/resources/js/gallery/jquery.prettyPhoto.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $(".portfolio a").hover(function () {
            $(this).children("img").animate({ opacity: 0.75 }, "fast");
        }, function () {
            $(this).children("img").animate({ opacity: 1.0 }, "slow");
        });

        $("a[rel^='prettyPhoto']").prettyPhoto({
            animation_speed: 'fast', /* fast/slow/normal */
            slideshow: 5000, /* false OR interval time in ms */
            autoplay_slideshow: false, /* true/false */
            opacity: 0.80, /* Value between 0 and 1 */
            show_title: true, /* true/false */
            allow_resize: true, /* Resize the photos bigger than viewport. true/false */
            default_width: 500,
            default_height: 344,
            counter_separator_label: '/', /* The separator for the gallery counter 1 "of" 2 */
            theme: 'pp_default', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
            horizontal_padding: 20, /* The padding on each side of the picture */
            hideflash: false, /* Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto */
            wmode: 'opaque' /* Set the flash wmode attribute */
        });
    });

</script>

<script src="<%=pathGreenBall%>/resources/js/gallery/isotope.js" type="text/javascript"></script>
<script type="text/javascript">

    $(window).load(function () {
        var $container = $('.albumContainer');
        $container.isotope({
            filter: '*',
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });

        $('.albumFilter li').click(function () {
            $('.albumFilter .current').removeClass('current');
            $(this).addClass('current');

            var selector = $(this).attr('data-filter');
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            return false;
        });
    });

</script>
<!-- Button Anchor Top-->
<script src="resources/js/jquery.ui.totop.js" type="text/javascript"></script>

<script src="<%=pathGreenBall%>/resources/js/custom.js" type="text/javascript"></script>
    <script src="<%=pathGreenBall%>/resources/js/jquery.bxslider.js" type="text/javascript"></script>
    <script>
        $('#product').bxSlider({
            minSlides: 3,
            maxSlides: 5,
            slideWidth: 215,
            slideMargin: 10
        });


        $('.vertical-news').bxSlider({
            mode: 'vertical',
            slideWidth: 1300, 
            minSlides: 3,
            slideMargin: 10
        });

    </script>


    <!--Carousel News Vertical-->

    <script src="<%=pathGreenBall%>/resources/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="<%=pathGreenBall%>/resources/js/jquery.mousewheel.js" type="text/javascript"></script>

   <!--Portfolio Video-->
   <script src="<%=pathGreenBall%>/resources/js/modernizr.custom.63321.js"></script>
  
   <script type="text/javascript" src="<%=pathGreenBall%>/resources/js/jquery.stapel.js"></script>
		<script type="text/javascript">
		    $(function () {

		        var $grid = $('#tp-grid'),
					$name = $('#name'),
					$close = $('#close'),
					$loader = $('<div class="loader"><i></i><i></i><i></i><i></i><i></i><i></i><span>Loading...</span></div>').insertBefore($grid),
					stapel = $grid.stapel({
					    onLoad: function () {
					        $loader.remove();
					    },
					    onBeforeOpen: function (pileName) {
					        $name.html(pileName);
					    },
					    onAfterOpen: function (pileName) {
					        $close.show();
					    }
					});

		        $close.on('click', function () {
		            $close.hide();
		            $name.empty();
		            stapel.closePile();
		        });

		    });
		</script>
	<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap.helper.phone.js"></script>
	<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap.helper.phone.format.js"></script>
	
	
  
	</script>
</body>
</html>
