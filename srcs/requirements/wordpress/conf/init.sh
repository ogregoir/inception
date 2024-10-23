#!/bin/sh

#download exec wordpress 
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp core download --allow-root 
/usr/local/bin/wp config create	--dbname="maria" --dbuser="inception" --dbpass="oce" --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
/usr/local/bin/wp core install --url="ogregoir.42.fr" --title="ogregoir42" --admin_user="ogregoir" --admin_password="oce" --admin_email="ogregoir@gmail.com" --skip-email --allow-root
/usr/local/bin/wp user create "invited" "invited@gmail.com" --role=author --user_pass="oce" --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm83 -F -R