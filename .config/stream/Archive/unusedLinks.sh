#!/bin/bash

filename=$@

if [ -z $filename ] ; then
  echo "Provide a filename as an argument."
  exit
fi

checkFile=`ls $filename 2> /dev/null`

if [ -z $checkFile ] ; then
  echo "ERROR: $filename does not exist."
  exit
fi

cat links/20230109.txt | grep "\[_\]" | awk '{$1="-"; print $0}' | sed 's/{//1 ; s/}//1' > "~/.stream/links/unused.txt"
