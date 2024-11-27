FROM debian:bullseye

RUN apt update && apt-get install nginx -y

COPY requirements/nginx/default /etc/nginx/sites-available

CMD ["nginx", "-g", "daemon off;"]
 