 #/bin/bash

/usr/bin/spawn-fcgi -f /usr/lib/cgi-bin/iipsrv.fcgi -p 9000 -F 1
exec tail -F /tmp/iipsrv.log
