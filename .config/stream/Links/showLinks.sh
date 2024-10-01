#!/bin/bash

#cat $HOME"/.stream/Links/currentStream.txt" | sed -r 's|\([0-9]\)\]|\1\n|g' > $HOME"/.stream/Links/tmp" 
#less $HOME"/.stream/Links/tmp"

#cat $HOME"/.stream/Links/currentStream.txt" | sed 's|\[\(.\)|\n\[\1|' | less  

less $HOME/.stream/Links/showLinks.txt
