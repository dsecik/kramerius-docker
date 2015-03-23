FROM tomcat:8

MAINTAINER Martin Rumanek <martin@rumanek.cz>

ENV REFRESHED_AT 2014-09-11
ENV OAIPROVIDER_DOWNLOAD_URL http://downloads.sourceforge.net/fedora-commons/oaiprovider-1.2.2.zip
ENV JDBC_DRIVER_DOWNLOAD_URL https://jdbc.postgresql.org/download/postgresql-9.3-1103.jdbc41.jar
ENV JAVA_OPTS -Xms1536m -Xmx4096m

WORKDIR $CATALINA_HOME/webapps
RUN curl -sL "$OAIPROVIDER_DOWNLOAD_URL" -o oaiprovider.zip \
    && unzip oaiprovider.zip \
    && mv oaiprovider-1.2.2/oaiprovider.war ./ \
    && unzip oaiprovider.war -d oaiprovider \
    && rm -rf oaiprovider-1.2.2 oaiprovider.zip ROOT docs examples manager host-manager oaiprovider.war

WORKDIR $CATALINA_HOME
RUN curl -sL "$JDBC_DRIVER_DOWNLOAD_URL" -o lib/postgresql-9.3-1103.jdbc41.jar
ADD proai.properties $CATALINA_HOME/webapps/oaiprovider/WEB-INF/classes/proai.properties
ADD log4j.xml $CATALINA_HOME/webapps/oaiprovider/WEB-INF/classes/log4j.xml

EXPOSE 8080
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]

