FROM mysql/mysql-server:latest
ADD "create_tables.sql" /docker-entrypoint-initdb.d/
ADD "populate_tables.sql" /docker-entrypoint-initdb.d/
ADD "set_privileges.sql" /docker-entrypoint-initdb.d/
ADD "init_host.sh" /docker-entrypoint-initdb.d/
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=gta
ENV MYSQL_USER=umkc
ENV MYSQL_PASSWORD=umkc
EXPOSE 3306