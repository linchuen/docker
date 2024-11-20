create database source;

use source;

CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '訂單ID',
  `sync` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
  `trans_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單號',
  PRIMARY KEY (`id`),
  UNIQUE KEY `trans_no_IDX` (`trans_no`),
  KEY `create_time_IDX` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='order sync';

INSERT INTO `order`
(order_id, sync, create_time, trans_no)
VALUES
(RAND(), 0, NOW(), UUID());

create database target;

