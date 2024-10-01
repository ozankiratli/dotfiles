#!/bin/bash

args="$@"
filename="/home/tholian/.stream/links/currentStream.txt"

url=`echo $args | grep -oP 'http.?://\S+'`
definition=`echo $args | sed -r 's|http.?://\S+||' | sed 's/^[[:space:]]*//g' | sed -e's/[[:space:]]*$//'`

checkLinkExists () {
  linkInFile=`grep $url $filename`
  fwL=`echo $linkInFile | awk '{print $1}'
  !([ -z $fwL ])
}

writeFile () {
    touch $filename
    lineCount=`wc -l $filename | awk '{print $1}'`
    nextLine=$(( $lineCount + 1 ))
    echo "[$nextLine][_] { $definition }   $url" >> $filename
}

if [ -z $url ] ; then
  echo "No url provided. Exiting."
  exit
elif checkLinkExists ; then 
  echo "The link exists!"
  exit
else
  writeFile
fi

