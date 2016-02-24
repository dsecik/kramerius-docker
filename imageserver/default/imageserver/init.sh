 #/bin/bash

/usr/bin/spawn-fcgi -f /usr/share/cgi-bin/iiifserver.fcgi -p $PORT -F $CHILDREN
exec tail -F /tmp/iipsrv.log
