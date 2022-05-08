UPDATE mysql.user SET host = '%' WHERE user='root';
UPDATE mysql.db SET host = '%' WHERE user='root';
FLUSH PRIVILEGES;
