#!/bin/bash

filename=$HOME"/.stream/Links/unusedLinks.txt"

countLines() {
 sed -n '=' $filename | wc -l
}

checkLinkExists () {
  linkInFile=`grep $url $nextStreamFile`
  fwL=`echo $linkInFile | awk '{print $1}'`
  !([ -z $fwL ])
}

writeFile () {
  touch $nextStreamFile
  lineCount=`wc -l $nextStreamFile | awk '{print $1}'`
  nextLine=$(( $lineCount + 1 ))
  echo "[$nextLine][_] { $definition }   $url" >> $nextStreamFile
}

streamCategory=`cat $HOME/.stream/currentCategory`

nextStreamFile=$HOME"/.stream/Links/nextStream_"$streamCategory".txt"

lineNo=1
while [ $(countLines) -ge $lineNo ] ; do
  line=`awk -v nLine=$lineNo 'NR==nLine' $filename`
  firstLetter=`echo $line | awk '{print $1}' | head -c 1`
  url=`echo $line | grep -oP 'http.?://\S+'`
  definition=`echo $line | awk '{$1="" ; print $0}' | sed -r 's|http.?://\S+||' | sed 's/^[[:space:]]*//g' | sed -e's/[[:space:]]*$//'`

  if [ -z $url ] ; then
    echo ""
    echo "No link in line." 
    echo $line
    echo "Skipping..."
    sleep 1
  elif checkLinkExists ; then
    echo ""
    echo "Link already exists"
    echo $linkInFile
    echo "Skipping..."
    sleep 1
  else
    firstWord=`echo $definition | awk '{print $1}'`
    if [ -z $firstWord ] ; then
      definition="No definition"
    fi
    echo ""
    echo "New Link:"
    echo "[$definition] $url"
    writeFile
  fi
  if [ $firstLetter == "#" ] ; then
    echo "Header line will not be deleted..."
    lineNo=$(( $lineNo + 1 )) 
  else
    sed -i "$lineNo"'d' $filename
  fi
  echo ""
  echo "-------"
done
