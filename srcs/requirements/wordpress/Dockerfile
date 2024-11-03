FROM alpine:3.20

RUN apk --no-cache update && apk --no-cache upgrade

RUN apk --no-cache add php83 \
			php83-fpm \
			php83-mysqli \
			php83-phar \
			curl \
			php83-common \
			php83-apache2 \
			php83-iconv \ 
			openrc

RUN addgroup nginx && adduser --system --no-create-home --ingroup nginx nginx 
COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf

COPY    ./conf/init.sh / 
RUN     chmod 777 /init.sh

EXPOSE 9000

CMD [ "./init.sh" ]
