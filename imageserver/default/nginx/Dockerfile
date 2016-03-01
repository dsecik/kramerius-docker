FROM nginx:latest

ADD nginx.conf /etc/nginx/conf.d/default.conf 

RUN chmod -R ugo+rwx /var/
RUN chmod -R ugo+rwx /run/
RUN mkdir -p /var/log/nginx/
RUN chmod -R ugo+rwx /var/log/nginx/
RUN chmod -R ugo+rwx /etc/nginx/
EXPOSE 8080

