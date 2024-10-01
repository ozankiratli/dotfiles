#!/bin/bash
echo "Setting Stream Category"
sleep 1s
echo ""
echo "Enter the number for today's stream category... [1-3]"
echo "1. Environmental Crisis"
echo "2. Virology"
echo "3. Law with Sierra"

read input

while true; do
  case $input in
    1 )
      streamCategory="Environment"
      break
      ;;
    2 )
      streamCategory="Virology"
      break
      ;;
    3 )
      streamCategory="Law"
      break
      ;;
    *)
      echo Wrong input. Try again [1-3]
      read input
      continue
      ;;
  esac
done
echo $streamCategory > $HOME/.stream/currentCategory
sleep 1s
echo ""
echo "---------------------------------------"
sleep 1s
echo ""
echo "Setting the stream topics..."
sleep 1s
echo ""
echo "Enter the MAIN topic of the stream:"
read mainTopic
$HOME/.stream/Topic/mainTopic.sh --new $mainTopic
sleep 1s
echo ""
echo "Enter the ALT topic of the stream:"
read altTopic
$HOME/.stream/Topic/altTopic.sh --new $altTopic
echo ""
echo "Stream topic is set..." 
sleep 1s
echo ""
echo "---------------------------------------"
sleep 1s
echo ""
echo "Arranging links for the stream..."
sleep 1s
echo ""
echo "WARNING: Failing to complete this step might result in errors."
sleep 1s
echo "If the links file is not ready, merge the links in a separate window using mergeLinks"
sleep 1s
echo "Press enter when done:"
read nullInput
sleep 1s
echo ""
echo "Moving the nextStream links file to currentStream"
mv $HOME"/.stream/Links/nextStream_"$streamCategory".txt" $HOME"/.stream/Links/currentStream.txt"
sleep 1s
echo ""
echo "---------------------------------------"
sleep 1s
echo ""
echo "Reoganizing the workspaces"
sleep 1s
monDell2415="Dell Inc. DELL U2415 PVJVW554203L"

swaymsg workspace "3: " 
wait
swaymsg move workspace to output eDP-1
wait

swaymsg workspace "4: "
wait
swaymsg move workspace to output eDP-1
wait

swaymsg workspace "5:  "
wait
swaymsg move workspace to output "'$monDell2415'"
wait

swaymsg workspace "6: " 
wait
swaymsg move workspace to output "'$monDell2415'"
wait

swaymsg workspace "7: "
wait
swaymsg move workspace to output eDP-1
wait 

swaymsg workspace "8: " 
wait
swaymsg move workspace to output eDP-1
wait

swaymsg workspace "9: " 
wait
swaymsg move workspace to output eDP-1
wait

swaymsg workspace "10: " 
wait
swaymsg move workspace to output eDP-1
wait

swaymsg workspace "1:  " 
wait
swaymsg move workspace to output eDP-1
wait

swaymsg workspace "2:  " 
wait
swaymsg move workspace to output "'$monDell2415'"
wait 

sleep 1s
echo ""
echo "---------------------------------------"
sleep 1s
echo ""
echo "Starting the stream software"
sleep 1s
echo ""
echo "Starting the Stream Deck: aka Lioranboard"
#SAMMI
LioranBoardCE
echo "Done"
sleep 1s
echo ""
echo "Starting Terminal: terminator:"
terminal
echo "Done"
sleep 1s
echo ""
echo "Starting browser control panels: Twitch, Discord, and Phantombot "
firefox --new-window www.twitch.tv/popout/dr_evolozzy/chat https://discord.com/channels/813116566332768287/835134297136300092  https://www.twitch.tv/moderator/dr_evolozzy  https://dashboard.twitch.tv/u/dr_evolozzy/stream-manager  https://phantombot.dev/panel  2> /dev/null 
sleep 2s
echo "Done!"
sleep 1s
echo ""
echo "---------------------------------------"
sleep 1s
echo ""
echo "Stream mode ready!"
