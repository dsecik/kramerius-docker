FROM nginx:latest

ADD nginx.conf /etc/nginx/conf.d/default.conf 

RUN chmod -R ugo+rwx /var/
RUN chmod -R ugo+rwx /run/
EXPOSE 8080
