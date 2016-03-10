FROM debian:jessie

ENV NGINX_VERSION 1.9.12-1~jessie
MAINTAINER Daniel Secik "daniel.secik@mzk.cz"

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
RUN chmod -R ugo+rwx /var/ && chmod -R ugo+rwx /run/

ADD nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

