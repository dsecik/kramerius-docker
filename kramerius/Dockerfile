FROM tomcat:8

MAINTAINER Martin Rumanek <martin@rumanek.cz>

ENV REFRESHED_AT 2014-03-24
ENV JDBC_DRIVER_DOWNLOAD_URL http://jdbc.postgresql.org/download/postgresql-9.3-1103.jdbc4.jar

## install packages
RUN apt-get -y  update && \
apt-get -y install wget unzip xmlstarlet curl less htop


# download binaries
RUN wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Installation-5.1.zip -O /tmp/installation.zip && \
    wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Core-5.1.0.zip -O /tmp/kramerius.zip && \
    wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Editors-5.1.0.zip -O /tmp/editors.zip && \
    unzip /tmp/kramerius.zip -d /tmp/ && \
    unzip /tmp/editors.zip -d /tmp/


RUN mv /tmp/Editors-5.1.0/editor.war  $CATALINA_HOME/webapps/editor.war && \
    mv /tmp/Editors-5.1.0/rightseditor.war  $CATALINA_HOME/webapps/rightseditor.war && \
    mv /tmp/Core-5.1.0/search.war  $CATALINA_HOME/webapps/search.war && \
    mv /tmp/Core-5.1.0/*.jar  $CATALINA_HOME/lib/ 


RUN curl -sL "$JDBC_DRIVER_DOWNLOAD_URL" -o $CATALINA_HOME/lib/postgresql-9.3-1103.jdbc4.jar
ADD search.xml $CATALINA_HOME/conf/Catalina/localhost/search.xml
ADD rightseditor.xml $CATALINA_HOME/conf/Catalina/localhost/rightseditor.xml

# JAAS
ENV JAAS_CONFIG $CATALINA_HOME/jaas.conf
ADD jaas.conf $CATALINA_HOME/jaas.conf

ENV SOLR_HOME /usr/local/solr
ENV JAVA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF8 -XX:MaxPermSize=256m -Xms1024m -Xmx3072m  -Djava.security.auth.login.config=$JAAS_CONFIG -Dsolr.solr.home=$SOLR_HOME


ADD migration.properties /root/.kramerius4/migration.properties
ADD indexer.properties /root/.kramerius4/indexer.properties
ADD configuration.properties /root/.kramerius4/configuration.properties
ADD docker-entrypoint.sh /
ADD lp.xml /root/.kramerius4/lp.xml

ADD server.xml $CATALINA_HOME/conf/
ADD rewrite.config $CATALINA_HOME/conf/Catalina/localhost/

EXPOSE 8080
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]

