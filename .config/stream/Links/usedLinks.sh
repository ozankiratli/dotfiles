#!/bin/bash

filename=$HOME"/.stream/Links/currentStream.txt"


#checkFile=`ls $filename 2> /dev/null`

#if [ -z $checkFile ] ; then
#  echo "ERROR: $filename does not exist."
#  exit
#fi

day=`date +"%Y%m%d"`
streamCategory=`cat $HOME/.stream/currentCategory`
info="$day $streamCategory"
touch $HOME"/.stream/Links/archivedLinks.txt"
cat $filename | grep "\[X\]" | awk -v today="$info" '{$1="- "today ; print $0}' >> $HOME"/.stream/Links/archivedLinks.txt"
cat $filename | grep "\[X\]" | awk '{$1="- "today ; print $0}' > $HOME"/.stream/Links/usedLinks.txt"
