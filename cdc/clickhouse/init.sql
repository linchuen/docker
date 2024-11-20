CREATE TABLE default.`cdc.cdc.order` (
    `id` UInt64,
    `order_id` Int32 COMMENT '訂單ID',
    `sync` UInt8 DEFAULT 0,
    `create_time` DateTime DEFAULT now() COMMENT '創建時間',
    `trans_no` String COMMENT '訂單'
) 
ENGINE = MergeTree()
PRIMARY KEY `trans_no`
ORDER BY (`trans_no`)
SETTINGS index_granularity = 8192;
