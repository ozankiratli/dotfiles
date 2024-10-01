#!/bin/bash

isXournal=`ps aux | grep xournal | grep -v grep | awk '{print $NF}'`

if [ -z $isXournal ] ; then
  xournal &> /dev/null &
  swaymsg workspace "WHITEBOARD"
else
  swaymsg workspace "WHITEBOARD"
fi

