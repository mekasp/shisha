<div class="container container-featured">
  <?php if($most_purchased_products) { ?>
    <div class="home_slider_products">
      <h1><?php echo $text_leaders; ?></h1>
      <div class="products-leaders carousel--show-several carousel--selected-cell">
        <?php foreach($most_purchased_products as $product) { ?>
          <div class="carousel-cell">
            <?php echo $this->getChild('module/product_item', array('product' => $product)); ?>
          </div>
        <?php } ?>
      </div>
    </div>
  <?php } ?>

</div>
<hr/>
<div class="container container-featured">
  <?php if($new_products) { ?>
    <div class="home_slider_products">
      <h1><?php echo $text_new; ?></h1>
      <div class="products-new carousel--show-several carousel--selected-cell">
        <?php foreach($new_products as $product) { ?>
        <div class="carousel-cell">
          <?php echo $this->getChild('module/product_item', array('product' => $product)); ?>
        </div>
        <?php } ?>
      </div>
    </div>
  <?php } ?>
</div>
<script type="text/javascript">
    var thisCells = 5;
    function getCells() {
      var cells = 5;
      if(window.innerWidth > 1299){
        cells = 5;
      }
      if(window.innerWidth < 1300){
        cells = 4;
      }
      if(window.innerWidth < 1000){
        cells = 3;
      }
      if(window.innerWidth < 700){
        cells = 2;
      }
      return cells;
    }
    function loadSliders() {
      var productSlider = {
        groupCells: getCells(),
        autoplay: true,
        pageDots: false,
        freeScroll: true
      };
      var productsLeaders = new Flickity( '.products-leaders', productSlider);
      productsLeaders.player.play();
      var productsNew = new Flickity( '.products-new', productSlider );
      productsNew.player.play();
    }
    $(document).ready(function () {
      loadSliders();
    });
    $(window).on('resize', function () {
      if(window.innerWidth > 1299){
        loadSliders();
        thisCells = getCells();
      }
      if(window.innerWidth < 1300 && thisCells !== getCells()){
        loadSliders();
        thisCells = getCells();
      }
      if(window.innerWidth < 1000){
        loadSliders();
        thisCells = getCells();
      }
      if(window.innerWidth < 700){
        loadSliders();
        thisCells = getCells();
      }
    });
</script>