<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div id="language">
    <div <?php if ($language_code == 'ua') { ?>class="active"<?php } else { ?>onclick="location.replace('<?php echo 'http://' . $_SERVER['HTTP_HOST'] . preg_replace('/\/ru/', '', $_SERVER['REQUEST_URI'], 1); ?>')" <?php } ?>><span>ukr</span></div>
  <div <?php if ($language_code == 'ru') { ?>class="active"<?php } else { ?>onclick="location.replace('<?php echo 'http://' . $_SERVER['HTTP_HOST'] . '/ru' . $_SERVER['REQUEST_URI']; ?>')" <?php } ?>><span>rus</span></div>
  </div>
</form>
<?php } ?>