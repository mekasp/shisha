<div id="block-for-slider">
    <div id="viewport">
        <!-- Desktop -->
        <ul id="slidewrapper">
            <?php foreach($banners as $key => $banner) { ?>
                <li class="slide">
                    <a href="<?php echo $banner['link']; ?>">
                        <img src="<?php echo $banner['image'] ?>" alt="1" class="slide-img" style="z-index:100;" />
                    </a>
                </li>
            <?php } ?>
        </ul>
        <?php if(count($banners) > 1) { ?>
            <div id="prev-next-btns">
                <div id="prev-btn"><i class="fa fa-angle-left"></i></div>
                <div id="next-btn"><i class="fa fa-angle-right"></i></div>
            </div>
        <?php } ?>
        <!-- Mobile -->
        <div id="mobile-slider" style="background: black">
            <?php foreach($banners as $key => $banner) { ?>
                <div class="banner-cell">
                    <a href="<?php echo $banner['link']; ?>">
                        <img src="<?php echo $banner['mobile_image'] ?>" alt="1" class="slide-img" style="z-index:100;" />
                    </a>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

<script type="text/javascript">
    var slideNow = 1;
    var slideCount = $('#slidewrapper').children().length;
    var slideInterval = 3000;
    var navBtnId = 0;
    var translateWidth = 0;

    $(document).ready(function() {
        var switchInterval = setInterval(nextSlide, slideInterval);
        $('#viewport').hover(function() {
            clearInterval(switchInterval);
        }, function() {
            switchInterval = setInterval(nextSlide, slideInterval);
        });
        $('#next-btn').click(function() {
            nextSlide();
        });
        $('#prev-btn').click(function() {
            prevSlide();
        });
        $('.slide-nav-btn').click(function() {
            navBtnId = $(this).index();
            if (navBtnId + 1 != slideNow) {
                translateWidth = -$('#viewport').width() * (navBtnId);
                $('#slidewrapper').css({
                    'transform': 'translate(' + translateWidth + 'px, 0)',
                    '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                    '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
                });
                slideNow = navBtnId + 1;
            }
        });

        //Mobile
        var productSlider = {
            contain: true,
            groupCells: 1,
            autoplay: true,
            pageDots: false,
            freeScroll: false
        };
        var productsLeaders = new Flickity( '#mobile-slider', productSlider);
        productsLeaders.player.play();
    });
    function nextSlide() {
        if (slideNow == slideCount || slideNow <= 0 || slideNow > slideCount) {
            $('#slidewrapper').css('transform', 'translate(0, 0)');
            slideNow = 1;
        } else {
            translateWidth = -$('#viewport').width() * (slideNow);
            $('#slidewrapper').css({
                'transform': 'translate(' + translateWidth + 'px, 0)',
                '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
            });
            slideNow++;
        }
    }
    function prevSlide() {
        if (slideNow == 1 || slideNow <= 0 || slideNow > slideCount) {
            translateWidth = -$('#viewport').width() * (slideCount - 1);
            $('#slidewrapper').css({
                'transform': 'translate(' + translateWidth + 'px, 0)',
                '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
            });
            slideNow = slideCount;
        } else {
            translateWidth = -$('#viewport').width() * (slideNow - 2);
            $('#slidewrapper').css({
                'transform': 'translate(' + translateWidth + 'px, 0)',
                '-webkit-transform': 'translate(' + translateWidth + 'px, 0)',
                '-ms-transform': 'translate(' + translateWidth + 'px, 0)',
            });
            slideNow--;
        }
    }
</script>