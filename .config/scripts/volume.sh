#!/bin/bash

# Function to get the current volume level
get_volume() {
  pamixer --get-volume
}

# Function to check if the sound is muted
is_mute() {
  pamixer --get-mute | grep -q "true"
}

# Function to send a notification about the current volume or mute status
send_notification() {
  if is_mute; then
    dunstify -r 2593 -u normal "Muted"
  else
    volume=$(get_volume)
    dunstify -r 5555 "Volume" -h int:value:"$volume" "$volume%"
  fi
}

# Handle the command-line argument (up, down, mute)
case "$1" in
  up)
    pamixer --unmute > /dev/null
    pamixer --increase 5 > /dev/null
    #send_notification
    ;;
  down)
    pamixer --unmute > /dev/null
    pamixer --decrease 5 > /dev/null
    #send_notification
    ;;
  mute)
    pamixer --toggle-mute > /dev/null
    #send_notification
    ;;
  micmute)
    pamixer --source 54 --toggle-mute > /dev/null
    #send_notification
    ;;
  *)
    echo "Usage: $0 {up|down|mute}"
    ;;
esac
