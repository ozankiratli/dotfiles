#!/bin/bash

arg=$@

linksPath=$HOME"/.stream/Links/"
streamLinksFile="$linksPath""currentStream.txt"
lioranboardPath=$HOME"/Nextcloud/SocialMedia/Software/SAMMI/"
showLinksFile="$linksPath""showLinks.txt"

readLink() {
  line=`grep $arg $streamLinksFile`
  echo "$line"
  echo ""
  link=`echo $line | grep -oP 'http.?://\S+'`
  echo "$link"
  echo ""
  cleanLine=`echo $line | awk '{$1="" ; print $0 }'`
  echo "$cleanLine"
  echo ""
}

detectYouTube () {
    link2check=$1
    checkYT=`echo $link2check | grep -i 'youtube\|youtu.be'`
    if [ -z $checkYT ] ; then
      false
    else
      true
    fi
}

markLink() {
  
  lineNo=`echo $line | awk '{print $1}' | sed  's|\[| |;s|\]| |' | awk '{print $1}'`
  str2Find="\[$lineNo\]\[\_\]"
  str2Replace="\[$lineNo\]\[X\]"
  sed -i "s|$str2Find|$str2Replace|" "$streamLinksFile"
} 

readLink
echo $cleanLine > "$linksPath""currentLink.txt"
echo $cleanLine > "$lioranboardPath""currentLink.txt"
if detectYouTube $link ; then
  yt $link
else
  browser $link
fi
markLink

cat $streamLinksFile | sed 's|\[\(.\)|\n\[\1|' > $showLinksFile
