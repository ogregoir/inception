FROM alpine:3.17

RUN apk add --no-cache \
    php81-fpm php81-mysqli wget tar

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress /var/www/html && \
    rm latest.tar.gz

COPY ./www.conf /etc/php81/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm81", "-F"]
