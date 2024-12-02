CREATE TABLE orders
(
    id UInt64,
    order_date Date,
    product_id UInt32,
    order_type UInt8,
    amount Decimal64(6)
) ENGINE = MySQL('mysql:3306', 'source', 'order' , 'root', 'example')
SETTINGS
    connection_pool_size=16,
    connection_max_tries=3,
    connection_wait_timeout=10,
    connection_auto_close=true,
    connect_timeout=10,
    read_write_timeout=3000
;