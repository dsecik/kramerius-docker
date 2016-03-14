FROM nginx:latest

RUN chmod -R ugo+rwx /var && chmod -R ugo+rwx /run
RUN rm /var/log/nginx/access.log && rm /var/log/nginx/error.log

EXPOSE 8080

ADD nginx.conf /etc/nginx/conf.d/default.conf 
CMD ["sleep"; "10000"]

