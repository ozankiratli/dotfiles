#!/bin/bash

streamCategory=`cat $HOME/.stream/currentCategory`
day=`date +"%Y%m%d"`

echo "This script will wrap up the end of the stream and prepare for the next stream..."
sleep 3s
echo ""
echo "Archiving the used links..."
sleep 2s
usedLinks
echo "Done!"
sleep 1s
echo ""
echo "Collecting unused links and moving them to next stream..."
sleep 1s
unusedLinks
sleep 1s
mergeUnusedLinks
echo "Done!"
sleep 1s
echo ""
echo "Cleaning the files..."
sleep 1s
mv $HOME/.stream/Links/unusedLinks.txt $HOME/.stream/Archive/
mv $HOME/.stream/currentCategory $HOME/.stream/Archive/
mv $HOME/.stream/Links/currentStream.txt $HOME/.stream/Archive/$day-$streamCategory.txt
echo "" > $HOME/.stream/Links/currentLink.txt
echo "Done!"

