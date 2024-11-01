#!/bin/sh

DB_NAME="${SQL_DATABASE}"
DB_USER="${SQL_USER}"
DB_PASS="${SQL_PASSWORD}"
ADMIN_USER="ogregoir"
ADMIN_PASS="${ADMIN_PASSWORD}"
ADMIN_EMAIL="ogregoir@student.42nice.com"

until mysqladmin ping -h "mariadb" --silent; do
    echo "Wait MariaDB..."
    sleep 1
done

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp core download --allow-root 
/usr/local/bin/wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
/usr/local/bin/wp core install --url="ogregoir.42.fr" --title="ogregoir42" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_EMAIL" --skip-email --allow-root
/usr/local/bin/wp user create "invited" "invited@gmail.com" --role=author --user_pass="$DB_PASS" --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm83 -F -R
