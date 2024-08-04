#!/bin/bash

get_brightness() {
  # Get the output of brightnessctl and filter the current brightness
  brightness=$(brightnessctl | grep 'Current brightness' | cut -d ':' -f 2 | tr -d ' ')
  
  # Extract the percentage using a regular expression
  brightness=$(echo $brightness | grep -oP '\(\d+%' | tr -d '()%')
  
  # Output the brightness
  echo $brightness
}

send_notification() {
  # Get the current brightness
  brightness=$(get_brightness)
     
  # Send the notification using dunstify
  dunstify -r 5555 "Brightness" -h int:value:"$brightness" "$brightness%"
}

case "$1" in
  up)
    # Increase the backlight by 5%
    brightnessctl set +5%
    send_notification
    ;;
  down)
    # Get current brightness percentage before decreasing
    current_brightness=$(get_brightness)
    
    # Check if the new brightness would be too low
    if [ "$current_brightness" -le 10 ]; then
      # Prevent the brightness from dropping below 10%
      brightnessctl set 10%
    else
      # Decrease the backlight by 5%
      brightnessctl set 5%-
      send_notification
    fi
    ;;
esac
