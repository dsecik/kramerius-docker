FROM debian:8.0

RUN apt-get update && apt-get install -y libjpeg-turbo-progs libpng12-0 libtiff5 libgomp1 libmemcached11 spawn-fcgi wget nano telnet \
&& rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose -O iipimage.deb http://ftp-devel.mzk.cz/imageserver/iipimage-jp2-amd64-1.0.deb \
&& dpkg -i iipimage.deb \
&& rm iipimage.deb

ENV LOGFILE=/tmp/iipsrv.log
ENV CHILDREN=1
ENV PORT=9000
ENV FILESYSTEM_PREFIX=/data/
ENV VERBOSITY=100
ENV JPEG_QUALITY=90
ENV MAX_IMAGE_CACHE_SIZE=10
ENV MAX_CVT=30000
ENV MAX_LAYERS=10
ENV MEMCACHED_SERVERS=memcached

#ADD test.jp2 /data/test.jp2

#RUN mkdir /data
#RUN mkdir /test && chmod g+w /test


EXPOSE 9000
ADD init.sh /init.sh

CMD /init.sh
