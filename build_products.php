<?php

require_once 'config.php';

class productsMeta{

    protected $db;
    private $script = "scripts/29.01.2021_product_meta.sql";
    private $categories = array('1' => "Купить табак ",'14' => "Купить кальян ",'15' => "Купить уголь ",'16' => "Купить аксессуары для кальянов ", '17' => 'Купить чашу для кальяна ', '18' => "Купить калауд для кальяна ");
    private $endSeo = " | Интернет-магазин Golden Shisha";

    public function __construct(){
        $this->db = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        $this->db->query("SET NAMES 'utf8'");
        $this->db->query("SET CHARACTER SET utf8");
        $this->db->query("SET CHARACTER_SET_CONNECTION=utf8");

        $categories = $this->db->query("SELECT c.category_id, cd.name FROM category c LEFT JOIN category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '0' AND cd.language_id = '1'")->fetch_all(MYSQLI_ASSOC);
        foreach ($categories as $category){
            $category_products = $this->db->query("SELECT ptc.product_id, pd.name, pd.description FROM product_to_category ptc LEFT JOIN product_description pd ON (ptc.product_id = pd.product_id) WHERE ptc.`category_id` = '" . (int)$category['category_id'] . "' AND pd.language_id = '1'");
            foreach ($category_products as $category_product){
                $title = $this->categories[$category['category_id']] . $category_product['name'] . $this->endSeo;
                $cutDesc = substr(strip_tags($category_product['description']), 0, 270);
                $description = substr($cutDesc, 0, strripos($cutDesc, ' ')) . '...' . $this->endSeo;
                $description = strip_tags(html_entity_decode($description));

                $sql = "UPDATE product_description SET `title` = '" . $this->db->real_escape_string($title) . "', `meta_description` = '" . $this->db->real_escape_string($description) . "' WHERE product_id = '" . (int)$category_product['product_id'] . "';" . "\r\n";
                file_put_contents($this->script, $sql, FILE_APPEND);
            }
        }

    }
}

new productsMeta();

?>