FROM debian:jessie


RUN apt-get update && apt-get install -y libjpeg-turbo-progs libpng12-0 libtiff5 libgomp1 libmemcached11 spawn-fcgi wget nano \
&& rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose --no-check-certificate -O iiifserver.deb 'http://downloads.klokantech.com/iiifserver/iiifserver-1.0.0-165.debian-jessie.amd64.deb' \
&& dpkg -i iiifserver.deb \
&& rm iiifserver.deb

ENV LOGFILE=/tmp/iipsrv.log
ENV CHILDREN=6
ENV PORT=9000
ENV FILESYSTEM_PREFIX=/data/
ENV VERBOSITY=100
ENV JPEG_QUALITY=90
ENV MAX_IMAGE_CACHE_SIZE=10
ENV MAX_CVT=30000
ENV MAX_LAYERS=10
ENV MEMCACHED_SERVERS=memcached

ADD init.sh /init.sh

CMD /init.sh

