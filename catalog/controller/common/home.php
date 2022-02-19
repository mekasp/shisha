<?php  
class ControllerCommonHome extends Controller {
	public function index() {
        $this->language->load('common/home');

	    $this->document->setTitle($this->language->get('seo_title'));
		$this->document->setDescription($this->language->get('seo_description'));

		$this->data['heading_title'] = $this->config->get('config_title');

        $this->data['text_site'] = $this->language->get('text_site');
        $this->data['text_site_desc'] = $this->language->get('text_site_desc');
        $this->data['text_shipping_info'] = $this->language->get('text_shipping_info');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}

		$this->load->model('catalog/product');
		$this->load->model('tool/image');
        $this->load->model('catalog/information');

		$this->data['information_desc'] = html_entity_decode($this->model_catalog_information->getInformation('6')['description']);

		$this->children = array(
			'common/content_top',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>