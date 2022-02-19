<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="UTF-8" />
  <title><?php echo $title; ?></title>
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content="<?php echo $keywords; ?>" />
  <?php } ?>
  <?php if ($icon) { ?>
  <link href="<?php echo $icon; ?>" rel="icon" />
  <?php } ?>
  <base href="<?php echo $base; ?>" />
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/slick.css" />
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/slicktheme.css" />
  <link rel="stylesheet" href="catalog/view/javascript/jquery/flickity/css/flickity-docs.css?ver=5" media="screen">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css?ver=27" />
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
  <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
  <script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
  <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
  <script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/bootstrap.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/jquery/slick.min.js"></script>
  <script src="catalog/view/javascript/jquery/flickity/flickity-docs.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/common.js?ver=7"></script>
  <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
  <?php } ?>
  <!--[if IE 7]>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
  <![endif]-->
  <!--[if lt IE 7]>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
  <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
  <script type="text/javascript">
    DD_belatedPNG.fix('#logo img');
  </script>
  <![endif]-->
  <?php echo $google_analytics; ?>
</head>
<body>
<div class="wrapper">
<div class="top_panel">
  <div class="container">
    <div class="contacts">
      <img src="image/data/mail.png" />
      <a class="mail_address" href="mailto:golden_shisha@ukr.net" style="margin: 5px">golden_shisha@ukr.net</a>
    </div>
    <div class="contacts">
      <img src="image/data/phone.png" />
      <a class="mail_address" style="margin: 5px">+38(067)545-59-55</a>
    </div>
    <div class="contacts" style="float: right;text-align: right">
      <a class="shipping_info" href="index.php?route=information/information&information_id=6" style="margin: 5px"><?php echo $text_shipping_info; ?></a>
    </div>
  </div>
</div>
<header class="header" id="header">
  <div class="container">
    <div class="logo"><a href="<?php echo $home; ?>"><img src="image/data/logo.png" /></a></div>
    <a class="open_menu" data-toggle="modal" data-target="#mobi" href="javascript:void(0);"><span></span><span></span><span></span></a>

    <div class="leng">
      <?php echo $language; ?>
    </div>

    <div class="center_head">
      <div class="head_search" id="form_search">
        <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
        <a class="button-search" href="javascript:void(0);"></a>
      </div>
    </div>
    <a href="<?php echo $cart_link; ?>">
      <div class="header-main-links header-cart">
        <div id="cart_header" class="img">
          <img src="image/data/basket.png"/>
          <?php if($this->cart->countProducts()) { ?>
            <span><?php echo $this->cart->countProducts(); ?></span>
          <?php } ?>
        </div>
        <div class="link-info">
          <h3><?php echo $text_shopping_cart; ?></h3>
          <p><?php echo $text_go_to_cart; ?></p>
        </div>
      </div>
    </a>
    <!--<a>
      <div class="header-main-links">
        <img src="image/data/user_icon.png"/>
        <div class="separator"></div>
        <div class="link-info">
          <h3>Личный кабинет</h3>
          <p>Войдите или зарегистрируйтесь</p>
        </div>
      </div>
    </a>-->
  </div>
</header>
<div id="nav" class="nav">
  <div class="nav-background"></div>
  <ul class="container">
    <?php if ($categories) { ?>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>
      <?php if ($category['children']) { ?>
      <!--<div class="dropDown">
        <div class="under_cut">
            <?php for ($i = 0; $i < count($category['children']); $i ++) { ?>
            <div>
              <?php if ((isset($category['children'][$i])) && ($category['children'][$i])) { ?>
                <a href="<?php echo $category['children'][$i]['href']; ?>" class="cut_title">
                  <?php if (!empty($category['children'][$i]['image_src'])) { ?>
                    <div class="sub_image"><img src="<?php echo $category['children'][$i]['image_src']; ?>" alt="<?php echo $category['children'][$i]['name']; ?>" /></div>
                  <?php } ?>
                  <span><?php echo $category['children'][$i]['name']; ?></span>
                </a>
                <?php if (!empty($category['children'][$i]['children'])) { ?>
                  <ul>
                    <?php foreach ($category['children'][$i]['children'] as $menu3item) { ?>
                      <li><a href="<?php echo $menu3item['href']; ?>"><?php echo $menu3item['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                <?php } ?>
              <?php } ?>
            </div>
            <?php } ?>
        </div>
      </div>-->
      <?php } ?>
    </li>
    <?php } ?>
    <?php } ?>
    <li class="mob-lang"><?php echo $language; ?></li>
  </ul>
  <!-- MOBILE CATEGORIES -->
  <div class="nav_mobile">
    <div class="arrows prev">
      <i class="fa fa-angle-left"></i>
    </div>
    <div class="mobile_cats">
      <?php foreach($categories as $category){ ?>
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php } ?>
    </div>
    <div class="arrows next">
      <i class="fa fa-angle-right"></i>
    </div>
  </div>

  <script type="text/javascript">
    $('.nav_mobile').children('.arrows').on('click', function () {
      var scrollTo = $('.mobile_cats').scrollLeft();
      if($(this).hasClass('prev')){
        scrollTo -= 100;
      }
      if($(this).hasClass('next')){
        scrollTo += 100;
      }
      $('.mobile_cats').animate({scrollLeft: scrollTo}, 300);
    });

    var startX = 0;
    $('.mobile_cats').on('touchstart', function (event) {
      $("body").css('overflow','hidden');
      startX = $(this).scrollLeft() + event.originalEvent.touches[0].pageX;
    });
    $('.mobile_cats').on('touchmove', function (event) {
      var moveX = event.originalEvent.touches[0].pageX;
      $(this).scrollLeft(startX - moveX);
    });
    $('.mobile_cats').on('touchend', function () {
      $("body").css('overflow','auto');
    });

    $('#nav > ul > li').on('mouseover', function () {
      $(this).children('.dropDown').show();
    });
    $('#nav > ul > li').on('mouseleave', function () {
      $('.dropDown').hide();
    });
  </script>
</div>

