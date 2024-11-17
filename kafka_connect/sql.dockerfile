FROM bitnami/mysql:9.0.1

COPY ./scripts /docker-entrypoint-initdb.d