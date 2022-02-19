<?php
require 'config.php';
class sql {
    private $db;
    private $file = 'scripts/16.02.2021_products_seo_url.sql';

    public function __construct()
    {
        $this->db = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        $this->db->query("SET NAMES 'utf8'");
        $this->db->query("SET CHARACTER SET utf8");
        $this->db->query("SET CHARACTER_SET_CONNECTION=utf8");

        require_once DIR_SYSTEM . 'library/PHPExcel/Classes/PHPExcel.php';
        $objReader = PHPExcel_IOFactory::createReader(PHPExcel_IOFactory::identify('urls.xlsx'));
        $objPHPExcel = $objReader->load('urls.xlsx'); // загружаем данные файла в объект
        $list = $objPHPExcel->getActiveSheet()->toArray(); // выгружаем данные из объекта в массив

        $sql = "";
        foreach ($list as $key => $row){
            if($key > 0){
                $sql .= "UPDATE `url_alias` SET `keyword` = '" . $this->db->real_escape_string(trim($row[2])) . "' WHERE `query` = CONCAT('product_id=','" . (int)$row[0] . "');";
            }
        }
        file_put_contents($this->file, $sql);
    }
}

new sql();

?>