FROM nginx:latest

ADD nginx.conf /etc/nginx/conf.d/default.conf 

RUN chmod -R ugo+rwx /var/
RUN chmod -R ugo+rwx /run/
RUN chmod -R ugo+rwx /var/log/nginx
RUN chmod 644 /etc/nginx/*
EXPOSE 8080

