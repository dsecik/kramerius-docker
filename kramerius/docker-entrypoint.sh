#!/bin/bash

if [ -n "$TOMCAT_PASSWORD" ] ; then
  mv /tmp/tomcat-users.xml "$CATALINA_HOME/conf/tomcat-users.xml";
  sed -i -e "s|\${TOMCAT_PASSWORD}|$TOMCAT_PASSWORD|" \
     "$CATALINA_HOME/conf/tomcat-users.xml";
fi


#TODO only missing models
function ingest2fedora {
  curl -vv -u "fedoraAdmin:fedoraAdmin" -H "Content-type:text/xml" -d "format=info:fedora/fedora-system:FOXML-1.1" -X POST --upload-file $1 http://fcrepo:8080/fedora/objects/new
}

#TODO better wait to fedora starts...
sleep 10
echo "ingesting fedora models"
MODELS=/tmp/Installation-5.1/fedora/*.xml
for MODEL in $MODELS
do
  ingest2fedora $MODEL
done

exec "$@"

