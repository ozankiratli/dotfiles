#!/bin/bash

isTerminator=`ps aux | grep terminator | grep -v grep | awk '{print $NF}'`

if [ -z $isTerminator ] ; then
  terminator &> /dev/null &
  swaymsg workspace "TERMINAL"
else
  swaymsg workspace "TERMINAL"
fi

