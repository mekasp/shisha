<?php echo $header; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="container">
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

    <?php if($categories) { ?>
      <?php echo $column_left; ?>
    <?php } ?>

    <div class="category_prod <?php if(!$categories) { echo 'width'; } ?>" >
      <div class="category-info">
        <h1><?php echo $heading_title; ?></h1>
      </div>
      <?php if ($products) { ?>
        <div class="product-filter">
          <div class="limit">
            <b><?php echo $text_limit; ?></b>
            <select onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="sort">
            <b><?php echo $text_sort; ?></b>
            <select onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>

        <ul class="product-list">
            <?php foreach ($products as $product) { ?>
              <?php echo $this->getChild('module/product_item', array('product' => $product)); ?>
            <?php } ?>
        </ul>
        <div class="pagination"><?php echo $pagination; ?></div>


        <?php if ($thumb || $description) { ?>
          <?php if ($thumb) { ?>
            <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
          <?php } ?>
          <?php if ($description) { ?>
            <div class="category_description">
              <div class="viewport">
                <div><?php echo $description; ?></div>
              </div>
              <div class="white-shadow"></div>
              <div class="readmore" onclick="readMore($(this))">
                <p class="closed">Читать далее</p>
                <p class="opened">Свернуть</p>
              </div>
            </div>
            <a></a>
          <?php } ?>
        <?php } ?>
      <?php } else { ?>
        <div class="no_products" style="position: relative;text-align: left;">
          <h2>Нет товаров</h2>
        </div>
      <?php } ?>
  </div>

  </div>
  <?php echo $content_bottom; ?>
</div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 
<?php echo $footer; ?>