#!/bin/bash

counter=0

if [ $recursiveConversion == "true" ]
then
  if [[ $depthOfRecursion =~ ^[0-9]+$ ]]
  then
    depth="-maxdepth $depthOfRecursion"
  else
    depth=""
  fi
else
  depth="-maxdepth 1"
fi

count=$(find /data $depth -iname "*.tif" | wc -l)

while IFS= read -r -d $'\0' file
do
  ((counter++))
  fileID=${file%.*}
  perl /scripts/convertTIFtoJP2.pl "$file" "$fileID.jp2"
  echo "$counter/$count"

done < <(find /data $depth -type f -iname "*.tif" -print0)

if [ -f /tmp/convertTempFiles/error.txt ]
then
  cp /tmp/convertTempFiles/error.txt /data
  echo "Conversion of some files ended with error. See error.txt"
fi