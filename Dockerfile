FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx wget mariadb-server php php-mysql php-cli php-fpm php-mbstring php-zip php-gd

COPY ./srcs/all_conf.sh /
RUN bash ./all_conf.sh
RUN mv /var/www/html /var/www/hello
RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xf latest-ru_RU.tar.gz
RUN mv ./phpMyAdmin-4.9.0.1-all-languages /var/www/hello/phpMyAdmin
RUN mv ./wordpress /var/www/hello/wordpress
COPY ./srcs/config.inc.php ./var/www/hello/phpmyadmin
COPY ./srcs/wp-config.php ./var/www/hello/wordpress
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled
RUN rm -rf /etc/nginx/sites-enabled/default
RUN rm -rf latest-ru_RU.tar.gz
RUN rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/ssl.key \
    -out /etc/ssl/certs/ssl.crt \
    -subj "/C=RU/ST=Moscow/L=Vyatskaya27c42/O=School21/CN=Makhmud"
RUN chown -R www-data /var/www/hello
RUN chown -R $USER:$USER /var/www/hello

EXPOSE 80 443
