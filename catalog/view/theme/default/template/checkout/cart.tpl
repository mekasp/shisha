<?php echo $header; ?>
<?php if ($success) { ?>
  <div class="success container" style="margin-top: 20px"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
  <div class="warning container" style="margin-top: 20px"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>

<div id="content" class="container">
  <div class="breadcrumb" style="margin-top: 30px;">
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
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="cart-info">
      <table>
        <thead>
          <tr>
            <td class="image"><?php echo $column_image; ?></td>
            <td class="name"><?php echo $column_name; ?></td>
            <td class="quantity"><?php echo $column_quantity; ?></td>
            <td class="price"><?php echo $column_price; ?></td>
            <td class="total"><?php echo $column_total; ?></td>
            <td class="remove" style="width: 55px">Удалить</td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="image"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?>
            </td>
            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div>
                <?php foreach ($product['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
              </div>
              <?php if ($product['reward']) { ?>
              <small><?php echo $product['reward']; ?></small>
              <?php } ?>
            </td>
            <td class="quantity">
              <a class="minus" href="index.php?route=checkout/cart/update&product_key=<?php echo $product['key']; ?>&quantity=<?php echo ($product['quantity'] - 1) ?>">-</a>
              <p class="num"><?php echo $product['quantity']; ?></p>
              <a class="plus" href="index.php?route=checkout/cart/update&product_key=<?php echo $product['key']; ?>&quantity=<?php echo ($product['quantity'] + 1) ?>">+</a>&nbsp;
            </td>
            <td class="price"><?php echo $product['price']; ?></td>
            <td class="total"><?php echo $product['total']; ?></td>
            <td class="remove" style="text-align: center"><a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>

    <div class="cart-info-mobile">
      <?php foreach ($products as $product) { ?>
        <div class="checkout-product">
          <div class="thumb">
            <p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
            <img src="<?php echo $product['thumb']; ?>" style="position: relative;left: 0;top: 0;width: 100px;" />
          </div>
          <div class="info">
            <a href="<?php echo $product['remove']; ?>" class="close">✖</a>
            <div class="quantity">
              <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
              <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
            </div>
            <div class="total">
              <p><?php echo $product['total']; ?></p>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>

    <div class="cart-total">
        <div class="center" style="position: absolute;"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_shopping; ?></a></div>
      <?php if($order_blocked) { ?>
      <p class="order_total_warning">Минимальная сумма заказа - <?php echo $min_total; ?> грн</p>
      <?php } ?>
        <table id="total">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="right"><b><?php echo $total['title']; ?>:</b></td>
            <td class="right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
    </div>
  </form>
  <h1>Оформление заказа</h1>
  <form id="formConfirm" class="form-confirm" action="<?php echo $confirm_action; ?>" method="post">
    <table class="checkout-form">
      <tr>
        <td><span>ФИО <span style="color: red;">*</span>:</span></td>
        <td <?php if(isset($errors['fio'])) { echo 'class="error-field"'; } ?>>
            <input type="text" name="fio" value="<?php if(isset($errors['fio'])) { echo $errors['fio']; } ?>" />
            <p class="error-warning">Введите ФИО!</p>
        </td>
      </tr>
      <tr>
        <td><span>Email <span style="color: red;">*</span>:</span></td>
        <td <?php if(isset($errors['email'])) { echo 'class="error-field"'; } ?>>
            <input type="text" name="email" value="<?php if(isset($errors['email'])) { echo $errors['email']; } ?>" />
            <p class="error-warning">Введите действительный E-mail!</p>
        </td>
      </tr>
      <tr>
        <td><span>Мобильный телефон <span style="color: red;">*</span>:</span></td>
        <td <?php if(isset($errors['phone'])) { echo 'class="error-field"'; } ?>>
            <input type="text" name="phone" value="<?php if(isset($errors['phone'])) { echo $errors['phone']; } ?>" />
            <p class="error-warning">Введите действительный номер телефона!</p>
        </td>
      </tr>
      <tr>
        <td><span>Город:</span></td>
        <td><input type="text" name="shipping_city" value="" /></td>
      </tr>
      <tr>
          <td>Способ доставки:</td>
          <td>
              <select name="shipping_method">
                  <option value="1">Новая Почта</option>
                  <option value="2">Доставка курьером</option>
                  <option value="3">Самовывоз</option>
              </select>
          </td>
      </tr>
      <tr class="shipping">
        <td><span>Номер отделения Новой почты</span></td>
        <td><input type="text" name="np_number" value="" /></td>
      </tr>
      <tr>
        <td><span>Комментарий:</span></td>
        <td><textarea name="comment"></textarea></td>
      </tr>
    </table>
  </form>

  <div class="right <?php if($order_blocked) { ?>button-blocked<?php } ?> button-confirm" <?php if(!$order_blocked) { ?>onclick="confirm();"<?php } ?>>
      <a class="button"><?php echo $button_checkout; ?></a>
      <p style="display:none;color: red;font-size: 15px;font-weight: bold">Минимальная сумма заказа - <?php echo $min_total; ?> грн!</p>
  </div>

  <?php echo $content_bottom; ?></div>
<script type="text/javascript">
  $('.form-confirm input').on('keyup', function () {
      $(this).parent().removeClass('error-field');
  });
  $('select[name="shipping_method"').on('change', function () {
     var html = '';
     if($(this).val() == '1'){
         html += '<td><span>Номер отделения Новой почты:</span></td> <td><input type="text" name="np_number" /></td>';
     } else if ($(this).val() == '2'){
         html += '<td><span>Доставка курьером по адресу:</span></td> <td><input type="text" name="courier_address" /></td>';
     } else if ($(this).val() == '3') {
         html += '<td><span>Пункт выдачи: </span></td><td><select name="shipping_selftake">';
            html += '<option value="г.Харьков ул. Героев Труда 13"><p>г.Харьков ул. Героев Труда 13</p></option>';
            html += '<option value="г.Харьков пр. Людвига Свободы, 43г"><p>г.Харьков пр. Людвига Свободы, 43г</p></option>';
            html += '<option value="г.Харьков пр. Юбилейный 64"><p>г.Харьков пр. Юбилейный 64</p></option>';
        html += '</select></td>';
     }
     $('#formConfirm').find('.shipping').html(html);
  });
  if($('.button-blocked').length){
      $('.button-blocked').on('click', function () {
         $(this).children('p').css('display', 'block');
      });
  }
</script>
<?php echo $footer; ?>