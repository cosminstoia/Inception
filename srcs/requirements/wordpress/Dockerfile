FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl

RUN mkdir /run/php -p

COPY requirements/wordpress/tools/www.conf /etc/php/7.4/fpm/pool.d/.

COPY requirements/wordpress/tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]