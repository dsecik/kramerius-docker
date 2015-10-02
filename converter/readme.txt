Kontainer na konverziu obrazkov

Podla prikazu s ktorym je kontainer spusteny skonvertuje vsetky jpegy alebo tify v adresari pripojenom do /data

Jpeg:
docker run -d -v /home/secikd/data/:/data convert /scripts/convertAllJpegs.sh
Tif:
docker run -d -v /home/secikd/data/:/data convert /scripts/convertAllTifs.sh
