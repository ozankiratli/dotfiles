#!/bin/bash

#day=`date`
#streamDay="monday"

args="$@"
url=`echo $args | grep -oP 'http.?://\S+'`
definition=`echo $args | sed -r 's|http.?://\S+||' | sed 's/^[[:space:]]*//g' | sed -e's/[[:space:]]*$//'`


writeFile () {
    filename=$HOME"/.stream/links/"$nextstream".txt"
    touch $filename
    lineCount=`wc -l $filename | awk '{print $1}'`
    nextLine=$(( $lineCount + 1 ))
    echo "[$nextLine][_] { $definition }   $url" >> $filename
}

nextstream="nextStream"
writeFile

#latestFile=`ls $HOME/.stream/links/ | sed 's/.txt//g' | sort -n | tail -1 `
#dayShort=`date +"%Y%m%d"`

#weekday=`echo $day | awk '{print $1}'`
#if [ $latestFile -ge $dayShort ] ; then
#  nextstream=$latestFile 
#else
#  nextstream=`date -d "this $streamDay" +"%Y%m%d"`
#fi
#echo "Next stream is on $nextstream. Do you want to continue? (y/n)"

#read input

#while true ; do
#case $input in
#  y | Y )
#    writeFile
#    exit
#    ;;
#  n | N )
#    echo "Do you want to enter a new date? (y/n)"
#    read input2
#    while  true ; do
#    case $input2 in
#      y | Y )
#	read manualDate
#    	nextstream=$manualDate
#        writeFile
#	exit
#	;;
#      n | N )
#	exit
#	;;
#      *)
#	echo "Wrong input. Try again (y/n)"
#	read input2
#	continue
#	;;
#    esac
#    done
#    ;;
#  * )
#    echo "Wrong input. Try again (y/n)"
#    read input
#    continue
#    ;;
#esac
#done
