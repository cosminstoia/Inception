FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server

COPY requirements/mariadb/tools/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY requirements/mariadb/tools/init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld"]