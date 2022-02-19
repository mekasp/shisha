<?php echo $header; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb container" style="margin-top: 30px;">
    <?php foreach ($breadcrumbs as $k => $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?>
    <?php if($k == 0){ ?>
    <a class="breadcrumb_home" href="/"><i class="fa fa-home"></i></a>
    <?php } elseif ($k < (count($breadcrumbs) - 1)) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } else { ?>
    <span class="name"><?php echo $breadcrumb['text']; ?></span>
    <?php } ?>
    <?php } ?>
  </div>

  <div class="product_card container">
    <ul class="product-tab-content">
      <li class="visible">
        <h1 class="mobile-product-title" itemprop="name"><?php echo $heading_title; ?></h1>
        <!-- Overal info -->
        <div class="product_media">
          <div class="cover">
            <img src="<?php echo $thumb; ?>" />
          </div>
          <div class="preview_images">
            <?php if(count($images)) { ?>
            <?php foreach($images as $key => $image) { ?>
            <img <?php if($key < 1) { echo 'class="active"'; } ?> src="<?php echo $image['thumb']; ?>" />
            <?php } ?>
            <?php } ?>
          </div>
          <div style="clear: both;"></div>

          <div class="price_and_shipping">
            <p class="stock_status" style="background: <?php echo $stock['color']; ?>;"><?php echo $stock['name']; ?></p>
            <div class="info">
              <p class="price"><?php echo $price; ?></p>
              <a class="buy" <?php if($stock['stock_status_id'] !== '5') { ?>onclick="addToCart('<?php echo $product_id; ?>');"<?php } ?> style="float: right;background:<?php echo $buy_button_background; ?>;"><?php echo $text_buy; ?></a>
              <div style="clear: both"></div>
            </div>
            <div class="info product-shipping" data-toggle="modal" data-target="#productShipping">
              <img src="image/data/shipping.png" />
              <p><?php echo $text_shipping_info; ?></p>
            </div>
          </div>
        </div>
        <div class="description_and_specifications_block">
          <h1 itemprop="name"><?php echo $heading_title; ?></h1>
          <!-- Characteristics -->
          <div class="description_and_specifications">
            <?php if(!isset($attributes_main) && !isset($attributes_sheet)){ ?>
              <div class="dscription_text"><?php echo $description ?></div>
            <?php } ?>
            <?php if(isset($attributes_main)){ ?>
              <div class="row">
                <h4><?php echo $text_characteristics; ?><b><?php echo $heading_title; ?></b></h4>
                <div class="specifications">
                  <?php foreach($attributes_main['attribute'] as $attribute){ ?>
                    <div>
                      <div class="key"><span><b><?php echo $attribute['name']; ?></b></span></div>
                      <div class="value"><span><?php echo $attribute['text']; ?></span></div>
                    </div>
                  <?php } ?>
                </div>
              </div>
            <?php } ?>
            <?php if(isset($attributes_sheet)){ ?>
              <div class="row">
                <h4><?php echo $text_smak_characteristics; ?><b><?php echo $heading_title; ?></b></h4>
                <div class="specifications-taste">
                  <?php foreach($attributes_sheet['attribute'] as $attribute){ ?>
                  <div class="row">
                    <div class="key"><span><b><?php echo $attribute['name']; ?></b></span></div>
                    <div class="value"><div class="fill" style="width:<?php echo (20.2 * (int)$attribute['text']) . '%'; ?>;"></div></div>
                  </div>
                  <?php } ?>
                </div>
              </div>
            <?php } ?>
          </div>
        </div>
        <div style="clear: both"></div>
        <?php if(isset($attributes_main) || isset($attributes_sheet)){ ?>
        <hr style="margin-top: 50px"/>
        <div class="description">
          <div class="description_and_specifications">
            <div class="row">
                <h1 itemprop="name"><?php echo $text_desc; ?><b><?php echo $heading_title; ?></b></h1>
                <div class="dscription_text"><?php echo $description ?></div>
            </div>
          </div>
          <!--<div class="reviews">
            <div class="row">
              <h1>Отзывы</h1>

              <a class="button">Оставить отзыв</a>
              <div class="info">
                <p class="text_row"><b>Виктор Бабенко</b></p>
                <div class="stars">
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                </div>
                <hr/>
                <p class="text_row">При заказе от 698грн - бесплатная доставка по Харькову</p>
              </div>
              <div class="info">
                <p class="text_row"><b>Виктор Бабенко</b></p>
                <div class="stars">
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                </div>
                <hr/>
                <p class="text_row">При заказе от 698грн - бесплатная доставка по Харькову</p>
              </div>
              <div class="info">
                <p class="text_row"><b>Виктор Бабенко</b></p>
                <div class="stars">
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                </div>
                <hr/>
                <p class="text_row">При заказе от 698грн - бесплатная доставка по Харькову</p>
              </div>
            </div>
          </div>-->
        </div>
        <?php } ?>
      </li>
      <li style="color:black;">
        <div class="description">
          <div class="reviews">
            <div class="row">
            <!--  <h1>Отзывы</h1>

              <a class="button">Оставить отзыв</a>
              <div class="info">
                <p class="text_row"><b>Виктор Бабенко</b></p>
                <div class="stars">
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                  <i class="fa fa-star-o" data-rat="3" aria-hidden="true"></i>
                </div>
                <hr/>
                <p class="text_row">При заказе от 698грн - бесплатная доставка по Харькову</p>
              </div>-->
            </div>
          </div>
        </div>
      </li>
      <?php if (isset($videos) && count($videos)) { ?>
      <li><a href="javascript:void(0);"><?php echo $text_video; ?></a></li>
      <?php } ?>
      <?php if(isset($photos) && count($photos)) { ?>
      <li><a href="javascript:void(0);">Фото</a></li>
      <?php } ?>
    </ul>
  </div>

  <script type="text/javascript">
    //nav-tabs
    $('.product-nav-tabs').children('li').on('click', function () {
      $(this).siblings().removeClass('active');
      $(this).addClass('active');
      $('.product-tab-content').children('li').css('display', 'none');
      $('.product-tab-content').children('li').eq($(this).index()).css('display', 'table');
    });
  </script>
  <?php echo $footer; ?>


