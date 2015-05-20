FROM debian:wheezy

RUN apt-get update && apt-get install -y libc6 libfcgi0ldbl libgcc1 libjpeg8 libmemcached10 libstdc++6 libtiff5 libapache2-mod-fcgid lighttpd jiipview iipimage-doc memcached imagemagick libvips-tools wget nano && rm -rf /var/lib/apt/lists/*
RUN wget --no-verbose  http://downloads.klokantech.com/iiifserver/iiifserver-1.0.0.debian-wheezy.amd64.deb && dpkg -i  iiifserver-1.0.0.debian-wheezy.amd64.deb && rm iiifserver-1.0.0.debian-wheezy.amd64.deb

ENV LOGFILE=/var/log/iipsrv/iipsrv.log
ENV CHILDREN=6
ENV PORT=9000
ENV FILESYSTEM_PREFIX=/data/
ENV VERBOSITY=100
ENV JPEG_QUALITY=90
ENV MAX_IMAGE_CACHE_SIZE=10
ENV MAX_CVT=30000
ENV MAX_LAYERS=10
ENV MEMCACHED_SERVERS=memcached

RUN mkdir -p /var/log/iipsrv
RUN touch /var/log/iipsrv/iipsrv.log

ADD init.sh /init.sh

CMD /init.sh

