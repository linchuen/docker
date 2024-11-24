CREATE DATABASE target;

USE target;

CREATE TABLE `order` (
    `id` Int64,
    `order_id` Int32 COMMENT '訂單ID',
    `sync` Int16 DEFAULT 0,
    `create_time` DateTime DEFAULT now() COMMENT '創建時間',
    `trans_no` String COMMENT '訂單'
) 
ENGINE = MergeTree()
ORDER BY (`id`,`order_id`);
