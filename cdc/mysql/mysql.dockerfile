FROM bitnami/mysql:8.0.35

COPY ./init.sql /docker-entrypoint-initdb.d/
