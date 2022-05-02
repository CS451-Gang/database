#!/bin/bash

# Allow external hosts (us via Docker) to connect to the database
mysql -uroot -proot gta < docker-entrypoint-initdb.d/set_privileges.sql

# Run the table creation script
mysql -uroot -proot gta < docker-entrypoint-initdb.d/create_tables.sql

# Populate tables with data
mysql -uroot -proot gta < docker-entrypoint-initdb.d/populate_tables.sql