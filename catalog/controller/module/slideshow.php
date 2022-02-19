<?php
class ControllerModuleSlideshow extends Controller {
	protected function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addScript('catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/slideshow.css');
		}

		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];

		$this->data['banners'] = array();
		$banners = $this->model_design_banner->getBanners();
		if ($banners) {
			foreach ($banners as $banner) {
				if (file_exists(DIR_IMAGE . $banner['image'])) {
					$imagesize = getimagesize(DIR_IMAGE . $banner['image']);
					$mobile_imagesize = getimagesize(DIR_IMAGE . $banner['mobile_image']);
				    $this->data['banners'][] = array(
						'link'  => $banner['link'],
						'image' => $this->model_tool_image->resize($banner['image'], $imagesize[0], $imagesize[1]),
                        'mobile_image' => $this->model_tool_image->resize($banner['mobile_image'], $mobile_imagesize[0], $mobile_imagesize[1]),
					);
				}
			}
		}

		$this->data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/slideshow.tpl';
		} else {
			$this->template = 'default/template/module/slideshow.tpl';
		}

		$this->render();
	}
}
?>