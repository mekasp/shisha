<li>
    <div class="item">
        <a class="stock-status" style="background:<?php echo $product['button_buy_color']; ?>"><?php echo $product['stock']; ?></a>
        <div class="image">
            <?php if ($product['special'] && isset($product['special_percent'])) { ?>
                <?php if ($product['special_type_id'] == 0) { ?>
                    <span class="sale">-<?php echo $product['special_percent'] ?>%</span>
                <?php } else { ?>
                    <span class="sale sale-markdown">-<?php echo $product['special_percent'] ?>%</span>
                <?php } ?>
            <?php } ?>
            <?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
            <?php } else { ?>
                <a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>"></a>
            <?php } ?>
        </div>
        <div class="descr">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['price']) { ?>
            <div class="prise_block">
                <div>
                    <?php if ($product['special'] && $product['special'] > 0) { ?>
                        <div class="old_price_line"><?php echo $product['price']; ?></div>
                        <div class="price"><?php echo $product['special']; ?></div>
                    <?php } else { ?>
                        <div class="price"><?php echo $product['price']; ?> грн</div>
                    <?php } ?>
                </div>
            </div>
            <?php } ?>
        </div>

            <div class="cart <?php if($product['stock_status_id'] == '5') { echo 'cart-false'; } ?>" style="display: block">
                <?php if ($product['discount_type'] == "") { ?>
                    <?php if($product['stock_status_id'] !== '5') { ?>
                        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" title="<?php echo $button_cart; ?>" style="color:<?php echo $product['button_buy_color']; ?>;"><?php echo $button_cart; ?></a>
                    <?php } else { ?>
                        <a title="<?php echo $button_cart; ?>" style="color:<?php echo $product['button_buy_color']; ?>;"><?php echo $button_cart; ?></a>
                    <?php } ?>
                <?php } else { ?>
                    <?php if ($product['preorder_discount'] != "-") { ?>
                        <a class="button_preorder" data-toggle="modal" data-target="#preorder_popup" title="<?php echo $button_cart; ?>" onclick="prepare_preorder('<?php echo $product['product_id']; ?>', '<?php echo $product['name']; ?>', '<?php echo $product['href']; ?>', '<?php echo $product['thumb'] ? $product['thumb'] : 'image/no_image.jpg'; ?>', '<?php echo $product['price']; ?>', '<?php echo $product['preorder_discount']; ?>', '<?php echo $product['discount_type']; ?>',0);"><?php echo $text_preorder; ?></a>
                    <?php } elseif(isset($product['exp_category']) && $product['exp_category'] == 1) { ?>
                        <a class="button_preorder" onclick="prepare_preorder('<?php echo $product['product_id']; ?>', '<?php echo $product['name']; ?>', '<?php echo $product['href']; ?>', '<?php echo $product['thumb'] ? $product['thumb'] : 'image/no_image.jpg'; ?>', '<?php echo $product['price']; ?>', '<?php echo $product['preorder_discount']; ?>', '<?php echo $product['discount_type']; ?>',1);" title="<?php echo $text_report_avail; ?>" data-toggle="modal" data-target="#preorder_popup"><?php echo $text_report_avail; ?></a>
                    <?php } else { ?>
                        <a onclick="$('#report_avail input[name=\'product_id\']').val('<?php echo $product['product_id']; ?>')" title="<?php echo $text_report_avail; ?>" data-toggle="modal" data-target="#report_avail"><?php echo $text_report_avail; ?></a>
                    <?php } ?>
                <?php } ?>
                <!--<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"></a></div>-->
            </div>

    </div>
</li>