#!/bin/bash

if [ -n "$FEDORA_PASSWORD" ] ; then
  xmlstarlet ed  --inplace -u "/users/user/@password" -v $FEDORA_PASSWORD $FEDORA_HOME/server/config/fedora-users.xml 
fi

if [ -n "$RITRIPLES_DB_HOST" ] && [ -n "$RITRIPLES_DB_NAME" ] ; then
xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
  -u "//x:datastore[@id='localPostgresMPTTriplestore']/x:param[@name='jdbcURL']/@value" -v "jdbc:postgresql://$RITRIPLES_DB_HOST/$RITRIPLES_DB_NAME" \
  $FEDORA_HOME/server/config/fedora.fcfg
fi

exec "$@"
