#!/bin/sh

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld
chmod 755 /run/mysqld
mysql_install_db --datadir=/var/lib/mysql --user=mysql

mysqld --datadir=/var/lib/mysql --skip-networking --user=mysql &
sleep 5

# Vérifier si le serveur est en cours d'exécution
if ! mysqladmin ping --silent; then
  echo "MySQL server did not start correctly."
  exit 1
fi

mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

exec /usr/bin/mysqld --user=mysql --console