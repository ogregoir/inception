FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add php83 \
			php83-fpm \
			php83-mysqli \
			php83-phar \
			curl \
			php83-common \
			php83-apache2 \
			php83-iconv \ 
			openrc

COPY    ./conf/init.sh / 
RUN     chmod 777 /init.sh

CMD [ "./init.sh" ]
