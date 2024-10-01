#!/bin/bash

arg=$@

#narg=`echo $arg | wc -w`

#nlink=`cat ~/.stream/links/20221226.txt | wc -l`

#echo $nlink

#if [[ $narg == 1 ]] && [[ $arg ]] && [ $arg -eq $arg 2>/dev/null ] && [ $arg -le $nlink ] ; then
#  echo "correct"
#else
#  echo "nope"
#fi

echo "Continue"

read input

while true ; do
  case $input in 
    Y | y )
      answer=true
      break
      ;;
    N | n )
      answer=false
      exit
      ;;
    * )
      echo "Try again"
      read input
      continue
      ;;
  esac
done

echo "Oh yeah!"

