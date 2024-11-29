FROM debian:bullseye

RUN apt update && apt-get install -y \
    nginx

COPY requirements/nginx/tools/default /etc/nginx/sites-available

CMD ["nginx", "-g", "daemon off;"]
 