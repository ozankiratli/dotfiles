#!/bin/bash

arg=$@
narg=`echo $arg | wc -w`

#day=`date`
#dayShort=`date +"%Y%m%d"`
#linksPath=~/.stream/links/
#filename=$dayShort

filename="currentStream"

streamLinksFile="$linksPath"$filename".txt"
lioranboardPath=$HOME"/Nextcloud/SocialMedia/Software/SAMMI/"

checkArg() {
  nLinks=`cat $streamLinksFile | wc -l`
  if [[ $narg == 1 ]] && [[ $arg ]] && [ $arg -eq $arg 2>/dev/null ] && [ $arg -le $nLinks ] ; then
    echo "Argument is within boundaries"
  else
    echo "Enter an integer below $nLinks"
    exit
  fi
}

readLink() {
  line=`head -$arg $streamLinksFile | tail -1 `
  link=`echo $line | grep -oP 'http.?://\S+'`
  cleanLine=`echo $line | awk '{$1="" ; print $0 }'`
}

detectYouTube () {
    link2check=$1
    checkYT=`echo $link2check | grep -i youtube`
    if [ -z $checkYT ] ; then
      false
    else
      true
    fi
}

markLink() {
  str2Find="\[$arg\]\[\_\]"
  str2Replace="\[$arg\]\[X\]"
  sed -i "s|$str2Find|$str2Replace|" "$streamLinksFile"
} 

openLink () { 
  checkArg
  readLink
  echo $cleanLine > "$linksPath""currentLink.txt"
  echo $cleanLine > "$lioranboardPath""currentLink.txt"
  if detectYouTube $link ; then
    yt $link
  else
    browser $link
  fi
  markLink
}

if [ -f "$streamLinksFile" ] ; then
  echo "Reading Links from $filename.txt"
  echo ""
  openLink
  exit
else
  #fileList=`ls $linksPath`
  #echo $fileList
  #mostRecent=`echo ${fileList} | sed 's/\.txt//g' | tr " " "\n" | sort -n |  tail -1`
  echo "$filename.txt does not exist. Do you want to move the most recent file [ nextStream.txt ] to today's stream? (y/n)"
  read input1
  while true ; do
    case $input1 in 
      y | Y )
	cp "$linksPath""nextStream.txt" $streamLinksFile
	openLink
	exit
	;;
      n | N )
	exit
	;;
#	echo "Do you want to use the most recent file without moving it to today's stream? (y/n)"
#	read input2
#	while true ; do
#	  case $input2 in
#	    y | Y )
#	      streamLinksFile="$linksPath"$mostRecent".txt"
#	      openLink
#	      exit
#	      ;;
#	    n | N )
#	      exit
#	      ;;
#	    * )
#	      echo "Wrong input. Try again (y/n)"
#	      read input2
#	      continue
#	      ;;
#	  esac
#	done
#	break
#	;;
      * )
	echo "Wrong input. Try again (y/n)"
	read input1
	continue
	;;
     esac
  done
fi

