FROM debian:8.0

MAINTAINER Daniel Secik "daniel.secik@mzk.cz"
ENV NGINX_VERSION 1.9.12-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
        && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
        && apt-get update \
        && apt-get install -y \
                                                ca-certificates \
                                                nginx=${NGINX_VERSION} \
                                                nginx-module-xslt \
                                                nginx-module-geoip \
                                                nginx-module-image-filter \
                                                gettext-base \
        && rm -rf /var/lib/apt/lists/*

ADD nginx.conf /etc/nginx/conf.d/default.conf
RUN chmod -R ugo+rwx /var && chmod -R ugo+rwx /run

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#        && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]


