#!/bin/bash

currentStreamFile=$HOME"/.stream/Links/currentStream.txt"

if [ -z $currentStreamFile ] ; then
  echo "Provide a filename as an argument."
  exit
fi

checkFile=`ls $currentStreamFile 2> /dev/null`

if [ -z $checkFile ] ; then
  echo "ERROR: $currentStreamFile does not exist."
  exit
fi

cat $currentStreamFile | grep "\[_\]" | awk '{$1="-"; print $0}' | sed 's/{//1 ; s/}//1' > $HOME"/.stream/Links/unusedLinks.txt"
