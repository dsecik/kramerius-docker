kramerius:
  build: .
  environment:
    - VIRTUAL_HOST=docker.mzk.cz
    - CATALINA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"
  volumes:
    - /data/kramerius/foxml-import:/data/foxml-import
  ports:
    - "8080:8080"
    - "80:80"
    - "8000:8000"
    - "8001:8001"
  links:
    - fedoraPostgres:fedoraPostgres
    - riTriplesPostgres:riTriplesPostgres
    - krameriusPostgres:krameriusPostgres
    - fcrepo:fcrepo
    - solr:solr
    - imageserver:imageserver
solr:
  build: ../solr/
  ports:
    - "8080"
fcrepo:
  build: ../fcrepo/3.6.2/
  volumes:
    - /data/fcrepo/data:/usr/local/fedora/data
  ports:
    - "8080"
  links:
    - fedoraPostgres:fedoraPostgres
    - riTriplesPostgres:riTriplesPostgres
fedoraPostgres:
  image: "martinrumanek/postgres:9.3"
  environment:
    - POSTGRES_USER=fedoraAdmin
    - POSTGRES_PASSWORD=fedoraAdmin
    - POSTGRES_DB=fedora3
  volumes:
    - /data/fcrepo/fedorapostgres:/var/lib/postgresql/data
riTriplesPostgres:
  image: "martinrumanek/postgres:9.3"
  environment:
    - POSTGRES_USER=fedoraAdmin
    - POSTGRES_PASSWORD=fedoraAdmin
    - POSTGRES_DB=riTriples
  volumes:
    - /data/fcrepo/ritriplespostgres:/var/lib/postgresql/data
krameriusPostgres:
  image: "martinrumanek/postgres:9.3"
  environment:
    - POSTGRES_USER=fedoraAdmin
    - POSTGRES_PASSWORD=fedoraAdmin
    - POSTGRES_DB=kramerius
  volumes:
    - /data/kramerius/postgres:/var/lib/postgresql/data
imageserver:
  image: moravianlibrary/iipsrv-nginx
  links:
    - iipsrv:imageserver
  volumes:
    - /data/logs:/logs
    - /etc/localtime:/etc/localtime
memcached:
  image: moravianlibrary/iipsrv-memcached
  command: memcached -u root -m 1024
iipsrv:
  image: moravianlibrary/iipsrv-imageserver
  links:
    - memcached:memcached
  volumes:
    - /data/imageserver:/data
  environment:
    - CHILDREN=6
    - PORT=9000
    - LOGFILE=/logs/iipsrv.log
    - FILESYSTEM_PREFIX=/data/
    - VERBOSITY=100
    - JPEG_QUALITY=90
    - MAX_IMAGE_CACHE_SIZE=10
    - MAX_CVT=30000
    - MAX_LAYERS=10
    - MEMCACHED_SERVERS=memcached
exampleimport:
  build: .
  volumes:
    - /data/kramerius/foxml-import:/data/foxml-import
    - /data/imageserver:/data/imageserver
  links:
    - kramerius:kramerius

