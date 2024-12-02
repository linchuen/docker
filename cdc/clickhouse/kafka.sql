CREATE TABLE source
(
    `ts` DateTime,
    `tag` String,
    `message` String
)
ENGINE = Kafka()
SETTINGS kafka_broker_list = 'kafka:9092',
         kafka_topic_list = 'tag',
         kafka_group_name = 'clickhouse',
         kafka_format = 'JSONEachRow';

CREATE TABLE target
(
    `ts` DateTime,
    `tag` String
)
ENGINE = MergeTree()
ORDER BY tag;

CREATE MATERIALIZED VIEW source_mv TO target AS
SELECT
    ts,
    tag
FROM source;