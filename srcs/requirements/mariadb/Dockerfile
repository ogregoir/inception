FROM alpine:3.20

RUN apk update && apk upgrade && apk add mariadb mariadb-common mariadb-client mariadb-server-utils

RUN	rm -rf /etc/mysql/maria.conf /etc/maria.conf ~/my.cnf
COPY conf/my.cnf /etc/mysql/my.cnf

RUN	mkdir -p /run/mysqld
RUN	mkdir -p /var/lib/mysql

RUN	chmod 777 /var/lib/mysql/
RUN	chown -R mysql /var/lib/mysql

COPY conf/setup.sh setup.sh
RUN	chmod +x setup.sh

CMD ["./setup.sh"]
