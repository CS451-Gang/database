#!/bin/bash

# Allow external hosts (us via Docker) to connect to the database
mysql -uroot -proot -e "UPDATE mysql.user SET host = '%' WHERE user='root';"

# Run the table creation script
mysql -uroot -proot gta < docker-entrypoint-initdb.d/create_tables.sql

# Populate tables with data
mysql -uroot -proot gta < docker-entrypoint-initdb.d/populate_tables.sql