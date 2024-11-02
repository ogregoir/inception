#!/bin/sh

#until mysqladmin ping -h "mariadb" --silent; do
#    echo "Wait MariaDB..."
#    sleep 1
#done
sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp core download --path="var/www/html"
cd var/www/html
/usr/local/bin/wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost=mariadb:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" 
/usr/local/bin/wp core install --url=ogregoir.42.fr --title=ogregoir42 --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --skip-email 
/usr/local/bin/wp user create "invited" "invited@gmail.com" --role=author --user_pass="$SQL_PASSWORD" 

mkdir -p /run/php

/usr/sbin/php-fpm83 -F -R
