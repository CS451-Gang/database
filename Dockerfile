FROM mysql/mysql-server:latest
ADD "set_root_password.sql" /docker-entrypoint-initdb.d/
ADD "create_tables.sql" /docker-entrypoint-initdb.d/
ADD "init_host.sh" /docker-entrypoint-initdb.d/
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=umkc-db
ENV MYSQL_USER=umkc
ENV MYSQL_PASSWORD=umkc