<div class="box">
  <div class="box-content">
    <div class="box-category">
      <ul style="position: relative;">
        <?php foreach ($categories as $category) { ?>
        <li style="position: relative;">
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active <?php echo $category['children'] ? 'bold' : ''; ?>"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>" <?php echo $category['children'] ? 'class="bold"' : ''; ?>><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <i class="open-cat fa fa-angle-right"></i>
          <ul class="children-categories" >
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><i class="fa fa-angle-right"></i> <?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><i class="fa fa-angle-right"></i><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function () {
      if(window.innerWidth > 899){
        $('.open-cat').trigger('click');
      }
  });
  $('.box-category li i').on('click', function () {
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $(this).css('transform', 'rotate(0deg)');
      $(this).siblings('.children-categories').slideUp();
    } else {
      $(this).css('transform', 'rotate(90deg)');
      $(this).siblings('.children-categories').slideDown();
      $(this).addClass('active');
    }
  });
</script>
