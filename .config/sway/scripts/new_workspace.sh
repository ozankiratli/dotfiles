#!/bin/bash 

NUM=$(($(swaymsg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
if [ $NUM -lt 11 ] ; then
	NUM=11
fi

WSNAME="$NUM: "

swaymsg workspace $WSNAME
