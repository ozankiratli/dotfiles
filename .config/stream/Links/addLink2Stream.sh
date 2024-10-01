#!/bin/bash

args="$@"

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


echo "Enter the number for the stream you want to add this link to... [1-3]"
echo "1. Environmental Crisis"
echo "2. Virology"
echo "3. Law with Sierra"

read input

while true; do
  case $input in
    1 )
      streamCategory="Environment"
      break
      ;;
    2 )
      streamCategory="Virology"
      break
      ;;
    3 )
      streamCategory="Law"
      break
      ;;
    *) 
      echo Wrong input. Try again [1-3]
      read input
      continue
      ;;
  esac
done
filename=$HOME"/.stream/Links/nextStream_"$streamCategory".txt"

if [ -z $url ] ; then
  echo "No url provided. Exiting."
  exit
elif checkLinkExists ; then
  echo "The link exists!"
  exit
else
  writeFile
fi
