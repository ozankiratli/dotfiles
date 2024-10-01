#!/bin/bash

#TEXT=`cat /home/tholian/Nextcloud/SocialMedia/Software/lioranboard2-lw/tts-text.ini | grep text | sed 's/text=//'`

TEXT=`cat /home/tholian/Nextcloud/SocialMedia/Software/SAMMI/tts-text.ini | grep text | sed 's/text=//'`

/usr/bin/pico2wave -l en-US -w /home/tholian/.stream/TTS/tts.wav "$TEXT"

sleep 2

/usr/bin/rsync -au -e 'ssh -p27340 -i/home/tholian/.ssh/stream_passless' /home/tholian/.stream/TTS/tts.wav evo@192.168.73.23:.stream/TTS/ &> /home/tholian/.stream/TTS/tts-log.txt
