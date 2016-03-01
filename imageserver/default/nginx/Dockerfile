FROM nginx:latest

ADD nginx.conf /etc/nginx/conf.d/default.conf 

ENV TOMCAT_USER tomcat
ENV TOMCAT_UID 8983
RUN groupadd -r $TOMCAT_USER && \
  useradd -r -u $TOMCAT_UID -g $TOMCAT_USER $TOMCAT_USER

RUN chmod -R ugo+rwx /var/
RUN chmod -R ugo+rwx /run/
EXPOSE 8080

USER $TOMCAT_USER

CMD ["nginx", "-g", "daemon off;"]
