#!/bin/bash

if ps aux | grep surf | grep -v grep ; then 
  echo "Another browser instance is running!"
  sleep 1
else 
  echo "Cleaning previous browsing data"
  rm -r ~/.surf/cache
  rm ~/.surf/cookies.txt
fi

GDK_BACKEND=x11 surf -z1.5 -d -g -a "a@A" $@ &> /dev/null &

swaymsg workspace "BROWSER"
