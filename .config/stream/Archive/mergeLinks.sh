#!/bin/bash

filename=$@

if [ -z $1 ] ; then
  echo "Enter file name to merge links from"
  exit
fi

#day=`date`
#dayShort=`date +%Y%m%d`
#latestDate=`ls ~/.stream/links/ | sed 's/.txt//g' | sort -n | tail -1 `
#dayShort=`date +"%Y%m%d"`

nextStreamFile="~/.stream/links/"$nextStream".txt"

countLines() {
 sed -n '=' $filename | wc -l
}

writeFile () {
  lineCount=`wc -l $nextStreamFile | awk '{print $1}'`
  nextLine=$(( $lineCount + 1 ))
  echo "[$nextLine][_] { $definition }   $url" >> $nextStreamFile
}

checkLinkExists () {
  linkInFile=`grep $url $nextStreamFile`
  fwL=`echo $linkInFile | awk '{print $1}'`
  !([ -z $fwL ])
}

nextStream="nextStream"

#if [ $nextStream -ge $dayShort ] ; then
#  nextStream=$latestDate
#else
#  echo "There is no file for next stream yet! Please create one."
#  exit
#fi

#echo "Next stream is on $nextStream. Do you want to continue? (y/n)"
#read input
#while true ; do
#  case $input in
#    Y | y )
#      break
#      ;;
#    N | n )
#      exit
#      ;;
#    * )
#      echo "Try again. (y/n)"
#      read input
#      continue
#      ;;
#  esac
#done

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
    echo "Do you want to add it to stream links?(y/n)"
    read input
    while true ; do
      case $input in
        y | Y )
          writeFile
	  break
	  ;;
        n | N )
	  break 
	  ;;
        * )
	  echo "Wrong input. Try again!"
	  read input
	  continue
	  ;;
      esac
    done
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
