FROM debian:jessie

RUN apt-get update && apt-get install -y libjpeg62 libtiff5 libgomp1 libmemcached11 lighttpd wget nano && rm -rf /var/lib/apt/lists/*
RUN wget --no-verbose http://ftp-devel.mzk.cz/imageserver/iipimage-jp2-amd64.deb && dpkg -i iipimage-jp2-amd64.deb && rm iipimage-jp2-amd64.deb

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
