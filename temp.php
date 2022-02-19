<?php

require_once 'config.php';
class Temp{

    protected $db;

    public function __construct(){
        $this->db = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        $categories = array(
            '0' => array(
                'name' => 'Табак',
                'children' => array(
                    '0' => array(
                        'name' => 'Весовой табак',
                        'children' => array(
                            '0' => array('name' => 'DARKSIDE'),
                            '1' => array('name' => 'Daily Hookah')
                        )
                    ),
                    '1' => array(
                        'name' => 'Фасованный табак',
                        'children' => array(
                            '0' => array('name' => 'White Angel'),
                            '1' => array('name' => 'Dozaj'),
                            '2' => array('name' => 'Pelikan'),
                            '3' => array('name' => 'Gixom'),
                            '4' => array('name' => 'ALL FAKHER'),
                            '5' => array('name' => 'Serbetli'),
                            '6' => array('name' => 'Daim'),
                            '7' => array('name' => 'Buta'),
                        )
                    )
                )
            ),
            '1' => array('name' => 'Кальяны'),
            '2' => array('name' => 'Уголь'),
            '3' => array('name' => 'Аксессуары'),
            '4' => array('name' => 'Чаши')
        );

        foreach ($categories as $main_category){
            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category SET `image` = '', `parent_id` = '0', `top` = '1', `column` = '1', `status` = '1'");
            $main_category_id = $this->db->insert_id;
            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_description SET `category_id` = '" . (int)$main_category_id . "', `language_id` = '1', `name` = '" . $main_category['name'] . "'");
            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_description SET `category_id` = '" . (int)$main_category_id . "', `language_id` = '2', `name` = '" . $main_category['name'] . "'");
            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_to_store SET `category_id` = '" . (int)$main_category_id . "', `store_id` = '0'");

            if (isset($main_category['children'])){
                foreach ($main_category['children'] as $sub_category){
                    mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category SET `image` = '', `parent_id` = '" . (int)$main_category_id . "', `top` = '0', `column` = '1', `status` = '1'");
                    $sub_category_id = $this->db->insert_id;
                    mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_description SET `category_id` = '" . (int)$sub_category_id . "', `language_id` = '1', `name` = '" . $sub_category['name'] . "'");
                    mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_description SET `category_id` = '" . (int)$sub_category_id . "', `language_id` = '2', `name` = '" . $sub_category['name'] . "'");
                    mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_to_store SET `category_id` = '" . (int)$sub_category_id . "', `store_id` = '0'");

                    if(isset($sub_category['children'])){
                        foreach ($sub_category['children'] as $sub_sub_category){
                            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category SET `image` = '', `parent_id` = '" . (int)$sub_category_id . "', `top` = '0', `column` = '1', `status` = '1'");
                            $sub_sub_category_id = $this->db->insert_id;
                            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_description SET `category_id` = '" . (int)$sub_sub_category_id . "', `language_id` = '1', `name` = '" . $sub_sub_category['name'] . "'");
                            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_description SET `category_id` = '" . (int)$sub_sub_category_id . "', `language_id` = '2', `name` = '" . $sub_sub_category['name'] . "'");
                            mysqli_query($this->db, "INSERT INTO " . DB_PREFIX . "category_to_store SET `category_id` = '" . (int)$sub_sub_category_id . "', `store_id` = '0'");
                        }
                    }

                }
            }

        }
    }
}

new Temp();

?>