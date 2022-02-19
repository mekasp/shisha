<?php

class ControllerModuleProductItem extends Controller
{

    public function index($settings){
        $this->language->load('module/product_item');

        $this->data['product'] = array();
        if (isset($settings['product'])) {
            $this->data['product'] = $settings['product'];
        }

        $this->data['button_wishlist'] = $this->language->get('button_wishlist');
        $this->data['button_cart'] = $this->language->get('button_cart');
        $this->data['button_singleclick'] = $this->language->get('button_singleclick');
        $this->data['text_main_characteristics'] = $this->language->get('text_main_characteristics');
        $this->data['text_preorder'] = $this->language->get('text_preorder');
        $this->data['text_report_avail'] = $this->language->get('text_report_avail');

        $config = $this->registry->get('config');
        $path = 'module/product_item' . '.tpl';
        if (file_exists(DIR_TEMPLATE . $config->get('config_template') . '/template/' . $path)) {
            $this->template = $config->get('config_template') . '/template/' . $path;
        } else {
            $this->template = 'default/template/' . $path;
        }

        $this->response->setOutput($this->render());
    }

}
