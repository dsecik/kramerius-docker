Kontainer na konverziu obrazkov

Podla prikazu s ktorym je kontainer spusteny skonvertuje vsetky jpegy alebo tify v adresari pripojenom do /data

Jpeg:
docker run -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllJpegs.sh
Tif:
docker run -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllTifs.sh

Kontainer umoznuje rekurzivnu konverziu v podadresaroch /data. Na to sluzi systemova premenna RECURSIVE_CONVERSION ktoru treba nastavit pri spusteni kontaineru na hodnotu 'true'.
Priklad:
run -e "RECURSIVE_CONVERSION=true" -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllTifs.sh

Pomocou premennej DEPTH_OF_RECURSION mozeme nastavit maximalnu hlbku rekurzie (vyzaduje kladne cele cislo)
Priklad:
run -e "RECURSIVE_CONVERSION=true" -e "DEPTH_OF_RECURSION=3" -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllTifs.sh
