FROM alpine:3.20

RUN apk update && apk upgrade && apk add mariadb mariadb-common mariadb-client mariadb-server-utils

RUN	rm -rf /etc/mysql/maria.conf /etc/maria.conf ~/maria.conf
COPY conf/maria.conf /etc/mysql/maria.conf

RUN	mkdir -p /run/mysqld
RUN	mkdir -p /var/lib/mysql

RUN	chmod 777 /var/lib/mysql/
RUN	chown -R mysql /var/lib/mysql

COPY conf/init.sh init.sh
RUN	chmod +x init.sh

CMD ["./init.sh"]
