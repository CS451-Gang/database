UPDATE mysql.user SET host = '%' WHERE user='root';
UPDATE mysql.db SET host = '%' WHERE user='root';
DROP USER 'root'@'localhost';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
