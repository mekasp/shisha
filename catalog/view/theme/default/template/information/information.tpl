<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
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
  <div class="container">
  <h1><?php echo $heading_title; ?></h1>
    <hr/>
  <div class="information_desc"> <?php echo $description; ?> </div>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>