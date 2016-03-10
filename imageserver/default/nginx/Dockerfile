FROM debian:jessie

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
RUN chmod -R ugo+rwx /var/ && chmod -R ugo+rwx /run/

ADD nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

