FROM mysql/mysql-server:latest
ADD "queries/create_tables.sql" /docker-entrypoint-initdb.d/
ADD "queries/populate_tables.sql" /docker-entrypoint-initdb.d/
ADD "queries/populate_accounts.sql" /docker-entrypoint-initdb.d/
ADD "queries/set_privileges.sql" /docker-entrypoint-initdb.d/
ENV MYSQL_DATABASE=gta
EXPOSE 3306