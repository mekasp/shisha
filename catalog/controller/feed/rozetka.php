<?php
class ControllerFeedRozetka extends Controller
{
    protected $categories = array();

    public function index()
    {
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $categories_query = $this->model_catalog_category->getCategories(0);
        foreach ($categories_query as $category){
            $this->categories[$category['category_id']] = $category;
        }

        $products = $this->getProducts();

        $output = '<?xml version="1.0" encoding="utf-8"?>';
        $output .= '<!DOCTYPE yml_catalog SYSTEM "shops.dtd">';
        $output .= '<yml_catalog date="' . date('Y-m-d h:i') . '">';
        $output .= '<shop>';
        $output .= '<name>golden-shisha.top</name>';
        $output .= '<company>Golden Shisha</company>';
        $output .= '<url>https://golden-shisha.top</url>';
        $output .= '<currencies><currency id="UAH" rate="1" /></currencies>';
        $output .= '<categories>';
        foreach ($this->categories as $category){
            $output .= '<category id="' . (int)$category['category_id'] . '">' . $category['name'] . '</category>';
        }
        $output .= '</categories>';
        $output .= '<offers>';

        foreach ($products as $product){
            $output .= '<offer id="' . (int)$product['product_id'] . '" available="true">';
                $output .= '<stock_quantity>100</stock_quantity>';
                $output .= '<url>' . $product['url'] . '</url>';
                $output .= '<price>' . $product['price'] . '</price>';
                $output .= '<currencyId>UAH</currencyId>';
                $output .= '<vendor>' . $product['vendor'] . '</vendor>';
                $output .= '<categoryId>' . $product['category_id'] . '</categoryId>';
                $output .= '<picture>' . $product['image'] . '</picture>';
                $output .= '<name>' . $product['name'] . '</name>';
                $output .= '<description>' . htmlspecialchars($product['description']) . '</description>';
                foreach ($product['attrs'] as $attr){
                    $output .= '<param name="' . $attr['name'] . '">' . $attr['value'] . '</param>';
                }
            $output .= '</offer>';
        }
        $output .= '</offers>';
        $output .= '</shop>';
        $output .= '</yml_catalog>';

        $this->response->addHeader('Content-Type: application/xml');
        $this->response->setOutput($output);
    }

    public function getProducts(){
        $result = array();
        $products = $this->db->query("SELECT p.product_id, p.image, p.price, p.vendor, pd.name, pd.description, ptc.category_id FROM product p LEFT JOIN product_description pd ON (p.product_id = pd.product_id) LEFT JOIN (SELECT ptc.product_id, ptc.category_id FROM product_to_category ptc LEFT JOIN category c ON (ptc.category_id = c.category_id) WHERE c.parent_id = 0 AND c.status = '1' GROUP BY product_id) ptc ON (ptc.product_id = p.product_id) WHERE p.`status` = '1' AND p.`vendor` != '' AND p.`price` > 0 AND ptc.category_id IS NOT NULL AND ptc.category_id != '1' AND pd.`language_id` = '" . (int)$this->config->get('config_language_id') . "'")->rows;
        foreach ($products as $product){
            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
            } else {
                $image = false;
            }
            if(!$image) continue;

            $attrs = array();
            $attribute_groups = $this->model_catalog_product->getProductAttributes($product['product_id']);
            if($attribute_groups) {
                foreach ($attribute_groups as $attribute_group){
                    foreach ($attribute_group['attribute'] as $attribute){
                        $attrs[] = array(
                            'name' => $attribute['name'],
                            'value' => $attribute['text']
                        );
                    }
                }
            }
            //if(!$attrs || count($attrs) < 3) continue;

            $result[(int)$product['product_id']] = array(
                'product_id' => $product['product_id'],
                'image' => $image,
                'url' => $this->url->link('product/product', 'product_id=' . (int)$product['product_id']),
                'price' => round($product['price']),
                'vendor' => $product['vendor'],
                'name' => $product['name'],
                'description' => $product['description'],
                'category_id' => $product['category_id'],
                'attrs' => $attrs,
            );
        }

        return $result;
    }
}