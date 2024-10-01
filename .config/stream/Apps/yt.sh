#!/bin/bash


mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --msg-level=all=no,ytdl_hook=trace $@ &> /dev/null &

swaymsg workspace "YOUTUBE"
