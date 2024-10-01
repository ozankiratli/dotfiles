#!/bin/bash

## VARIABLES

topicFile=$HOME/.stream/Topic/altTopic.txt
touch $topicFile
deckFolder=$HOME/Nextcloud/SocialMedia/Software/SAMMI/
remoteStreamFolder=Stream:.stream/Topic/


## FUNCTIONS

displayHelp () {
  echo "[ no argument ]   : Displays current topic as in topic.txt file,"
  echo "                    replaces the files in other folders if" 
  echo "                    necessary, and quits."
  echo "-d | --delete     : Removes topic"
  echo "-r | --remove     : Removes topic (Same withe delete)"
  echo "-n | --new <text> : Changes the topic"
  echo "-c | --change     : Changes the topic (Same with new)" 
}

writeTopic () {
  echo "$topic" > $topicFile
}

replaceFiles () {
  /usr/bin/rsync -r $topicFile $deckFolder
  /usr/bin/rsync -r $topicFile $remoteStreamFolder
}


## MAIN
if [ -z "$1" ] ; then
  topic=`cat $topicFile`
  echo $topic
else
  case $1 in 
    -d | --delete | -r | --remove ) 
      topic=""
      echo $topic
      writeTopic
      ;;
    -n | --new | -c | --change )
      shift
      if [ -z "$1" ] ; then
	echo "No new topic was provided, using the old one!"
        topic=`cat $topicFile`
      else
        topic=$@
      fi
      echo $topic
      writeTopic
      ;;
    -h | --help )
      displayHelp 
      ;;
    *) 
      echo "ERROR: Wrong use of arguments. Refer to help."
      echo ""
      displayHelp
      exit
    ;;
  esac
fi

replaceFiles

