FROM bitnami/clickhouse:24.8.7

COPY ./init.sql /docker-entrypoint-initdb.d/
