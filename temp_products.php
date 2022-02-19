<?php

header('Content-type: text/html; charset=utf-8');

require_once 'config.php';

class TempProducts{

    protected $db;
    protected $aplhabet;
    protected $key = 0;
    protected $attrs = array();

    public function __construct(){
        $this->aplhabet = range('A', 'Z');

        $this->db = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        $this->db->query("SET NAMES 'utf8'");
        $this->db->query("SET CHARACTER SET utf8");
        $this->db->query("SET CHARACTER_SET_CONNECTION=utf8");

        require_once DIR_SYSTEM . 'library/PHPExcel/Classes/PHPExcel.php';

        $row = 1;

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->createSheet();
        $objPHPExcel->setActiveSheetIndex(1);
        $objPHPExcel->getActiveSheet()->setTitle('Products');
        $objPHPExcel->getActiveSheet()->SetCellValue("A" . $row, "product_id");
        $objPHPExcel->getActiveSheet()->SetCellValue("B" . $row, "Name");
        $objPHPExcel->getActiveSheet()->SetCellValue("C" . $row, "SEO URL");

        $this->key = 3;

        $query = $this->db->query("SELECT * FROM gs.attribute_description WHERE language_id = '1'");
        foreach ($query->fetch_all(MYSQLI_ASSOC) as $attribute){
            $objPHPExcel->getActiveSheet()->SetCellValue($this->aplhabet[$this->key] . 1, $attribute['name']);
            $this->attrs[$attribute['attribute_id']] = $this->aplhabet[$this->key];
            $this->key++;
        }

        $row++;
        $query = $this->db->query("SELECT p.product_id, pd.name, (SELECT `keyword` FROM `url_alias` WHERE `query` = CONCAT('product_id=', p.product_id)) as `seo_url`  FROM product p LEFT JOIN product_description pd ON (p.product_id = pd.product_id) LEFT JOIN (SELECT product_id, COUNT(*) as `total` FROM product_to_category WHERE category_id = '1' GROUP BY product_id) ptc ON (p.product_id = ptc.product_id) WHERE pd.language_id = '1' AND ptc.total IS NULL  ORDER BY p.product_id DESC");
        foreach ($query->fetch_all(MYSQLI_ASSOC) as $product){
            $objPHPExcel->getActiveSheet()->SetCellValue("A" . $row, $product['product_id']);
            $objPHPExcel->getActiveSheet()->SetCellValue("B" . $row, $product['name']);
            $objPHPExcel->getActiveSheet()->SetCellValue("C" . $row, $product['seo_url']);

            $product_attrs = $this->db->query("SELECT * FROM product_attribute WHERE product_id = '" . (int)$product['product_id'] . "' AND language_id = '1'");
            foreach ($product_attrs->fetch_all(MYSQLI_ASSOC) as $product_attr){
                $objPHPExcel->getActiveSheet()->SetCellValue($this->attrs[$product_attr['attribute_id']] . $row, $product_attr['text']);
            }

            $row++;
        }

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('products_without_tabak.xls');
    }
}

new TempProducts();

?>