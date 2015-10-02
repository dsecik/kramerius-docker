#!/bin/bash

counter=0
count=$(find /data -maxdepth 1 -iname "*.jpg" | wc -l)

while IFS= read -r -d $'\0' file
do
  ((counter++))
  fileID=${file%.*}
  perl /scripts/convertJPGtoJP2.pl "$file" "$fileID.jp2"
  echo "$counter/$count"

done < <(find /data -maxdepth 1 -type f -iname "*.jpg" -print0)
