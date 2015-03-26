FROM debian:jessie

MAINTAINER Martin Rumanek <martin@rumanek.cz>

## install packages
RUN apt-get -y  update && \
apt-get -y install curl

ADD docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]

