service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'adm'@'localhost' IDENTIFIED BY 'bocal';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'adm'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
