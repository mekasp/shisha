/* DELETE GARBAGE */
DELETE FROM attribute WHERE `attribute_id` > '3';
DELETE FROM attribute_description WHERE `attribute_id` > '3';
ALTER TABLE attribute AUTO_INCREMENT=4;

/* SMALL EDITS */
UPDATE attribute_description SET `attribute_id` = '1' WHERE attribute_id = '0';
UPDATE attribute_description SET `name` = 'Вес грамм' WHERE attribute_id = '1';
INSERT INTO attribute_group SET `sort_order` = '1';
INSERT INTO attribute_group_description (`attribute_group_id`, `language_id`, `name`)
VALUES ('2','1','sheet'), ('2','2','sheet');
ALTER TABLE attribute ADD COLUMN `status` TINYINT(1) NOT NULL DEFAULT '1';

/* INSERT ATTRIBUTES  (TABAK) */
INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Дымность'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Дымность');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Жаростойкость'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Жаростойкость');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Крепость'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Крепость');

INSERT INTO attribute SET `attribute_group_id` = '2', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Кислость'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Кислость');

INSERT INTO attribute SET `attribute_group_id` = '2', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Пряность'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Пряность');

INSERT INTO attribute SET `attribute_group_id` = '2', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Свежесть'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Свежесть');

INSERT INTO attribute SET `attribute_group_id` = '2', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Сладость'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Сладость');

/* INSERT ATTRIBUTES (HOOKAH) */
INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Высота'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Высота');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Диаметр шахты'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Диаметр шахты');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Диффузор'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Диффузор');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Количество портов под шланг'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Количество портов под шланг');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Материал шахты'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Материал шахты');

INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`, `language_id`, `name`) VALUES ((SELECT MAX(`attribute_id`) FROM attribute), '1', 'Тип соединения'), ((SELECT MAX(`attribute_id`) FROM attribute), '2', 'Тип соединения');

