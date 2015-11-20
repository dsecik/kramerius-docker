FROM moravianlibrary/kramerius:base

RUN curl -sL http://ftp-devel.mzk.cz/kramerius/mzkgrafika/search.war -o $CATALINA_HOME/webapps/search.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/mzkgrafika/security-core.jar -o $CATALINA_HOME/lib/security-core.jar && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/mzkgrafika/client.war -o $CATALINA_HOME/webapps/client.war