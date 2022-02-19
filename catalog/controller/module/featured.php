<?php
class ControllerModuleFeatured extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured'); 

      	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['button_cart'] = $this->language->get('button_cart');
        $this->data['text_leaders'] = $this->language->get('text_leaders');
        $this->data['text_new'] = $this->language->get('text_new');

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

        $this->data['most_purchased_products'] = array();
        $most_purchased = $this->model_catalog_product->getMostPurchasedProducts();
        if($most_purchased) {
            foreach ($most_purchased as $result) {
                if ($result['image']) {
                    $imagesize = getimagesize(DIR_IMAGE . $result['image']);
                    $image = $this->model_tool_image->resize($result['image'], 245, 245);
                } else {
                    $image = false;
                }
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }
                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }
                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                $stock = $this->model_catalog_product->getStock($result['stock_status_id']);

                $attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);
                $this->data['most_purchased_products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                    'price' => (int)$price,
                    'special' => $special,
                    'tax' => $tax,
                    'stock'            => $stock['name'],
                    'stock_status_id' => $result['stock_status_id'],
                    'button_buy_color' => ($stock['stock_status_id'] == '5' ?  '#dddddd' : $stock['color']),
                    'rating' => $result['rating'],
                    'reviews' => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                    'href' => $this->url->link('product/product', '&product_id=' . $result['product_id']),
                    'attribute_groups' => $attribute_groups,
                    'discount_type' => ""
                );
            }
        }

        $this->data['new_products'] = array();
        $new_products = $this->model_catalog_product->getNewProducts();
        foreach ($new_products as $result){
            if ($result['image']) {
                $imagesize = getimagesize(DIR_IMAGE . $result['image']);
                $image = $this->model_tool_image->resize($result['image'], 245, 245);
            } else {
                $image = false;
            }
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }
            if ($this->config->get('config_tax')) {
                $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
            } else {
                $tax = false;
            }

            $stock = $this->model_catalog_product->getStock($result['stock_status_id']);

            $attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);
            $this->data['new_products'][] = array(
                'product_id' => $result['product_id'],
                'thumb' => $image,
                'name' => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'price' => (int)$price,
                'special' => $special,
                'tax' => $tax,
                'stock'            => $stock['name'],
                'stock_status_id' => $result['stock_status_id'],
                'button_buy_color' => ($stock['stock_status_id'] == '5' ?  '#dddddd' : $stock['color']),
                'rating' => $result['rating'],
                'reviews' => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href' => $this->url->link('product/product', '&product_id=' . $result['product_id']),
                'attribute_groups' => $attribute_groups,
                'discount_type' => ""
            );
        }

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();
	}
}
?>