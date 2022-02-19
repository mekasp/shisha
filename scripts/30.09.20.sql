UPDATE oc_setting SET `value` = '1' WHERE `key` = 'config_alert_mail';
UPDATE oc_setting SET `value` = 'golden_shisha@ukr.net'  WHERE `key` = 'config_email';
ALTER TABLE oc_banner ADD COLUMN `sort_order` INT(11) NOT NULL DEFAULT '0';

/* 20.10.2020 */
INSERT INTO gs.setting SET `store_id` = '0', `group` = 'google', `key` = 'google_sitemap_status', `value` = 1, `serialized` = '0';
UPDATE product SET date_modified = NOW();
ALTER TABLE information ADD COLUMN `date_added` datetime NOT NULL DEFAULT NOW();
ALTER TABLE information ADD COLUMN `date_modified` datetime NOT NULL DEFAULT NOW();
UPDATE category SET date_modified = NOW();
UPDATE setting SET `value` = '1' WHERE `key` = 'config_seo_url';
ALTER TABLE banner_image ADD COLUMN `mobile_image` VARCHAR(255) NULL;

/* 16.11.2020 */
UPDATE `stock_status` SET `name` = 'В наличии' WHERE (`stock_status_id` = '7') and (`language_id` = '1');
UPDATE `stock_status` SET `name` = 'Предзаказ' WHERE (`stock_status_id` = '8') and (`language_id` = '1');
UPDATE `stock_status` SET `name` = 'Нет в наличии' WHERE (`stock_status_id` = '5') and (`language_id` = '1');
UPDATE `stock_status` SET `name` = 'Ожидается' WHERE (`stock_status_id` = '6') and (`language_id` = '1');
UPDATE `stock_status` SET `name` = 'Expected' WHERE (`stock_status_id` = '4') and (`language_id` = '2');
CREATE TABLE `stock_status_description` (
  `stock_status_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `language_id` TINYINT(1) NOT NULL
) ENGINE = MyISAM DEFAULT CHARACTER SET = utf8;
INSERT INTO stock_status_description (`stock_status_id`,`language_id`,`name`)
VALUES
('8','1','Предзаказ'),
('8','2','Preorder'),
('7','1','В наличии'),
('7','2','In stock'),
('6','1','Ожидается'),
('6','2','Expected'),
('5','1','Нет в наличии'),
('5','2','Out of stock');

ALTER TABLE stock_status DROP COLUMN `name`;
ALTER TABLE stock_status ADD COLUMN `color` VARCHAR (50);
DELETE FROM stock_status WHERE stock_status_id IN ('1','2','3','4');
UPDATE stock_status SET `color` = '#243f56' WHERE `stock_status_id` = '8';
UPDATE stock_status SET `color` = '#b0c96d' WHERE `stock_status_id` = '7';
UPDATE stock_status SET `color` = '#f89406' WHERE `stock_status_id` = '6';
UPDATE stock_status SET `color` = '#b22222' WHERE `stock_status_id` = '5';

/* 17.11.20 */
DELETE FROM attribute WHERE attribute_id > 3;
UPDATE attribute_description SET `name` = 'Вес грамм' WHERE `attribute_id` = '1';
ALTER TABLE attribute AUTO_INCREMENT 4;
INSERT INTO attribute (`attribute_group_id`,`sort_order`) VALUES
('1','0'),
('1','0'),
('1','0'),
('1','0'),
('1','0'),
('1','0'),
('1','0'),
('1','0');
ALTER TABLE `attribute_description` DROP PRIMARY KEY;
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES
('4','1','Вкус'),
('4','2','Вкус'),
('5','1','Дымность'),
('5','2','Дымность'),
('6','1','Жаростойкость'),
('6','2','Жаростойкость'),
('7','1','Крепость'),
('7','2','Крепость'),
('8','1','Кислость'),
('8','2','Кислость'),
('9','1','Пряность'),
('9','2','Пряность'),
('10','1','Свежесть'),
('10','2','Свежесть'),
('11','1','Сладость'),
('11','1','Сладость');
ALTER TABLE `product_attribute` DROP PRIMARY KEY;;
DELETE FROM product_attribute WHERE attribute_id = '2';