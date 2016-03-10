FROM nginx:latest

RUN rm /var/log/nginx/access.log && rm /var/log/nginx/error.log
RUN chmod -R ugo+rwx /var/ && chmod -R ugo+rwx /run/

ADD nginx.conf /etc/nginx/conf.d/default.conf 
