FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx wget mariadb-server php php-mysql php-fpm php-cli php-mbstring php-zip php-gd
