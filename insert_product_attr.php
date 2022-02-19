<?php
require 'config.php';
class sql {
    private $db;
    private $sql = 'scripts/27.02.2021_update_product_attr.sql';
    private $attributes = array();

    public function __construct()
    {
        $this->db = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        $this->db->query("SET NAMES 'utf8'");
        $this->db->query("SET CHARACTER SET utf8");
        $this->db->query("SET CHARACTER_SET_CONNECTION=utf8");

        require_once DIR_SYSTEM . 'library/PHPExcel/Classes/PHPExcel.php';
        $objReader = PHPExcel_IOFactory::createReader( PHPExcel_IOFactory::identify('products.xlsx') );
        $objPHPExcel = $objReader->load('products.xlsx'); // загружаем данные файла в объект
        $list = $objPHPExcel->getActiveSheet()->toArray(); // выгружаем данные из объекта в массив
        $count = 0;
        foreach ($list as $key => $row){
            if($key > 0){
                $insert_attributes = array();
                $product_id = $row[0];
                if ($product_id){
                    file_put_contents($this->sql, "DELETE FROM `product_attribute` WHERE `product_id` = '" . (int)$product_id . "';", FILE_APPEND);

                    if(trim($row[11]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '11', '1', '" . $this->db->real_escape_string($row[11]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '11', '2', '" . $this->db->real_escape_string($row[11]) . "')";
                    }
                    if(trim($row[12]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '12', '1', '" . $this->db->real_escape_string($row[12]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '12', '2', '" . $this->db->real_escape_string($row[12]) . "')";
                    }
                    if(trim($row[13]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '13', '1', '" . $this->db->real_escape_string($row[13]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '13', '2', '" . $this->db->real_escape_string($row[13]) . "')";
                    }
                    if(trim($row[14]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '14', '1', '" . $this->db->real_escape_string($row[14]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '14', '2', '" . $this->db->real_escape_string($row[14]) . "')";
                    }
                    if(trim($row[15]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '15', '1', '" . $this->db->real_escape_string($row[15]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '15', '2', '" . $this->db->real_escape_string($row[15]) . "')";
                    }
                    if(trim($row[16]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '16', '1', '" . $this->db->real_escape_string($row[16]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '16', '2', '" . $this->db->real_escape_string($row[16]) . "')";
                    }


                    if(trim($row[18]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '18', '1', '" . $this->db->real_escape_string($row[18]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '18', '2', '" . $this->db->real_escape_string($row[18]) . "')";
                    }
                    if(trim($row[19]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '19', '1', '" . $this->db->real_escape_string($row[19]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '19', '2', '" . $this->db->real_escape_string($row[19]) . "')";
                    }
                    if(trim($row[20]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '20', '1', '" . $this->db->real_escape_string($row[20]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '20', '2', '" . $this->db->real_escape_string($row[20]) . "')";
                    }
                    if(trim($row[21]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '21', '1', '" . $this->db->real_escape_string($row[21]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '21', '2', '" . $this->db->real_escape_string($row[21]) . "')";
                    }
                    if(trim($row[22]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '22', '1', '" . $this->db->real_escape_string($row[22]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '22', '2', '" . $this->db->real_escape_string($row[22]) . "')";
                    }
                    if(trim($row[23]) !== '') {
                        $insert_attributes[] = "('" . (int)$product_id . "', '23', '1', '" . $this->db->real_escape_string($row[23]) . "')";
                        $insert_attributes[] = "('" . (int)$product_id . "', '23', '2', '" . $this->db->real_escape_string($row[23]) . "')";
                    }

                    if($insert_attributes) {
                        file_put_contents($this->sql, "INSERT INTO product_attribute (`product_id`,`attribute_id`,`language_id`,`text`) VALUES " . implode(',', $insert_attributes) . "; ", FILE_APPEND);
                    }
                }
            }
        }
    }

    public function getProductId($name){
        $query = $this->db->query("SELECT product_id FROM product_description WHERE `name` = '" . $name . "' LIMIT 1");
        if($query->num_rows){
            return $query->fetch_row()[0];
        } else {
            return false;
        }
    }

    public function getAttrId($attribute_name){
        $query = $this->db->query("SELECT attribute_id FROM attribute_description WHERE `name` = '" . $attribute_name . "' LIMIT 1");
        if($query->num_rows){
            return $query->fetch_row()[0];
        } else {
            return false;
        }
    }
}

new sql();

?>