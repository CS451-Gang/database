#!/bin/bash

mysql -uroot -proot -e "UPDATE mysql.user SET host = '%' WHERE user='root';"