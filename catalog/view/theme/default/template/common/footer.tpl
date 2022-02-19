<footer id="footer">
  <div class="container">
    <!--  <?php if ($informations) { ?>
    <div class="footer_column">
      <h3><?php echo $text_information; ?></h3>
      <ul>
        <?php foreach ($informations as $information) { ?>
        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
    <?php } ?>
    <div class="footer_column">
      <h3><?php echo $text_account; ?></h3>
      <ul>
        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
    </div>-->
    <div class="logotip">
     <div id="logo1"> <h4><?php echo $text_joinus; ?></h4>
       <a href="https://www.instagram.com/golden_shishakh"><img src="image/data/instagram.png"/></a>
       <a href="https://t.me/Golden_Shishakh"><img src="image/data/telegram.png"></a>
       <a href="https://www.facebook.com/golden.shisha.75"><img src="image/data/facebook.png"></a>
     </div>
     <div class="contacts-block">
       <div class="contacts">
         <img src="image/data/mail.png" />
         <a class="mail_address" href="mailto:golden_shisha@ukr.net">golden_shisha@ukr.net</a>
       </div>
       <div class="contacts">
         <img src="image/data/phone.png" />
         <a class="mail_address">+38(067)545-59-55</a>
       </div>
     </div>
     <div id="logo2">
       <img src="image/data/logo.png" />
         <?php echo $text_work_graph; ?>
     </div>
    </div>
  </div>
  <div id="powered"><p>Copyright © 2020</p></div>
</footer>

<div class="modal fade" id="cartModal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <div class="modal-title h4"><h2 style="text-align: center;margin: 0;padding: 0"><?php echo $text_added_product; ?></h2></div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="productShipping" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <div class="modal-title h4"><h2 style="text-align: center;margin: 0;padding: 0"><?php echo $text_shipping_info; ?></h2></div>
        <div class="information_desc" style="text-align: center;"><?php echo $shipping_information; ?></div>
      </div>
    </div>
  </div>
</div>

<div class="search_modal" id="searchModal" >
  <div class="search" style="z-index: 200;">
    <input type="text" name="mobile_search" value="" />
    <a class="button-search" href="javascript:void(0);"></a>
    <a class="close" onclick="$(this).parent().parent().fadeOut();" >✖</a>
  </div>
  <div class="background" ></div>
</div>


</div>
<script type="text/javascript">
  //fixed header categories
  var navOffsetTop = parseInt($('#nav').offset().top);
  $(window).resize(function () {
    navOffsetTop = parseInt($('#nav').offset().top);
  });
  $(window).on('scroll', function () {
    if (navOffsetTop <= parseInt($(window).scrollTop())) {
      $('#nav').addClass('fixed-categories');
    } else {
      $('#nav').removeClass('fixed-categories');
    }
  });
</script>
<script>
  /*$(document).ready(function () {
    if (window.navigator && window.navigator.vibrate) {
      navigator.vibrate(1000);
    }
  });*/
</script>
</body></html>