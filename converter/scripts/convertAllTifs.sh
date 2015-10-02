#!/bin/bash

counter=0
count=$(find /data -maxdepth 1 -iname "*.tif" | wc -l)

while IFS= read -r -d $'\0' file
do
  ((counter++))
  fileID=${file%.*}
  perl /scripts/convertTIFtoJP2.pl "$file" "$fileID.jp2"
  echo "$counter/$count"

done < <(find /data -maxdepth 1 -type f -iname "*.tif" -print0)
