FROM debian:bullseye

RUN apt-get update && apt-get install php php-fpm -y

RUN mkdir /run/php -p

COPY requirements/wordpress/www.conf /etc/php/7.4/fpm/pool.d/.

CMD ["php-fpm7.4", "-F"]