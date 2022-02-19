INSERT INTO attribute SET `attribute_group_id` = '1', `sort_order` = '0', `status` = '1';
INSERT INTO attribute_description (`attribute_id`,`language_id`,`name`) VALUES
((SELECT MAX(`attribute_id`) FROM `attribute`), '1', 'Вкус'),
((SELECT MAX(`attribute_id`) FROM `attribute`), '2', 'Вкус');