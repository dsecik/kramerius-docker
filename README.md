# kramerius-docker
 Docker balíček pro Kramerius https://github.com/ceskaexpedice/kramerius a další balíčky s komponenty, nutnýni pro jeho běh

[![Join the chat at https://gitter.im/moravianlibrary/kramerius](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/moravianlibrary/kramerius?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Pro spuštění je nutné mít nainstalované dvě komponenty:
- http://docs.docker.com/installation/debian/
- http://docs.docker.com/compose/install/

Pro provoz Krameria je nutné pustit více kontejnerů:
- kramerius
- solr
- fedora
- několik provozních databází postgres (dvě pro fedoru, jednu pro Krameria)
- imageserver
- nginx pro imageserver
- memcached

Tyto kontejnery je nutné za pomocí nástroje docker-compose spojit.

vytvoříme soubor `docker-compose.yml`
```
kramerius:
  image: moravianlibrary/kramerius
  volumes:
    - /data/kramerius/foxml-import:/data/foxml-import
    - /data/kramerius/.kramerius4:/root/.kramerius4
  ports:
    - "8080"
  links:
    - fedoraPostgres:fedoraPostgres
    - riTriplesPostgres:riTriplesPostgres
    - krameriusPostgres:krameriusPostgres
    - fcrepo:fcrepo
    - solr:solr
  restart: always
fcrepo:
  image: moravianlibrary/fcrepo:3.6.2
  volumes:
    - /data/kramerius/fcrepo/datastreams:/usr/local/fedora/data/datastreams
    - /data/kramerius/fcrepo/objects:/usr/local/fedora/data/objects
    - /data/kramerius/fcrepo/resourceIndex:/usr/local/fedora/data/resourceIndex
  ports:
    - "8080"
  links:
    - fedoraPostgres:fedoraPostgres
    - riTriplesPostgres:riTriplesPostgres
  restart: always
fedoraPostgres:
  image: "martinrumanek/postgres:9.3"
  environment:
    - POSTGRES_USER=fedoraAdmin
    - POSTGRES_PASSWORD=fedoraAdmin
    - POSTGRES_DB=fedora3
  volumes:
    - /data/kramerius/fcrepo/fedorapostgres:/var/lib/postgresql/data
  restart: always
  riTriplesPostgres:
  image: "martinrumanek/postgres:9.3"
  environment:
    - POSTGRES_USER=fedoraAdmin
    - POSTGRES_PASSWORD=fedoraAdmin
    - POSTGRES_DB=riTriples
  volumes:
    - /data/kramerius/fcrepo/ritriplespostgres:/var/lib/postgresql/data
  restart: always
krameriusPostgres:
  image: "martinrumanek/postgres:9.3"
  environment:
    - POSTGRES_USER=fedoraAdmin
    - POSTGRES_PASSWORD=fedoraAdmin
    - POSTGRES_DB=kramerius
  volumes:
    - /data/kramerius/kramerius/postgres:/var/lib/postgresql/data
  restart: always
imageserver:
  image: moravianlibrary/iipsrv-nginx
  links:
    - iipsrv:imageserver
  restart: always
memcached:
  image: moravianlibrary/iipsrv-memcached
  command: memcached -u root -m 1024
  restart: always
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
  restart: always

```

poté příkazem `docker-compose up -d`  pustíme.
