Kontainer na konverziu obrazkov

Podla prikazu s ktorym je kontainer spusteny skonvertuje vsetky jpegy alebo tify v adresari pripojenom do /data

Jpeg:
docker run -d -v /some_directory/:/data convert /scripts/convertAllJpegs.sh
Tif:
docker run -d -v /some_directory/:/data convert /scripts/convertAllTifs.sh
