INSERT INTO `attribute` SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '1', `name` = 'Диаметр внутренний мм.';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '2', `name` = 'Діаметр внутрішній мм.';

INSERT INTO `attribute` SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '1', `name` = 'Объём л.';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '2', `name` = 'Обсяг л.';

INSERT INTO `attribute` SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '1', `name` = 'Бренд';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '2', `name` = 'Бренд';

INSERT INTO `attribute` SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '1', `name` = 'Цвет';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '2', `name` = 'Колір';

INSERT INTO `attribute` SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '1', `name` = 'Страна Производитель';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '2', `name` = 'Країна виробник';

INSERT INTO `attribute` SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '1', `name` = 'Страна регистрации Бренда';
INSERT INTO `attribute_description` SET `attribute_id` = (SELECT MAX(`attribute_id`) FROM `attribute`), `language_id` = '2', `name` = 'Країна реєстрації Бренда';