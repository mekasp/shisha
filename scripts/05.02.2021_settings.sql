UPDATE setting SET `value` = 'ua' WHERE `key` = 'config_language';

INSERT INTO url_alias (`query`,`keyword`) VALUES ('checkout/cart','cart');
INSERT INTO url_alias (`query`,`keyword`) VALUES ('common/home','');