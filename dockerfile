FROM mysql

COPY ./db-schema /docker-entrypoint-initdb.d

