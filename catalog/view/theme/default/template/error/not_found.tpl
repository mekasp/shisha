<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="container"><?php echo $content_top; ?>
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
  <div class="content"><?php echo $text_error; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>