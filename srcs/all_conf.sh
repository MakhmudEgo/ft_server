service nginx start
service php7.3-fpm start
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'adm'@'localhost' IDENTIFIED BY 'bmocal';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'adm'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
