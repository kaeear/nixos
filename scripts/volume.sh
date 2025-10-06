#!/run/current-system/sw/bin/bash

#gives dustify as output depending on volume
function send_notification {
   volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2}') #set current volume into variable
   volume_percent=$(echo "$volume * 100" | bc) #volume to percentage
   if [ "$(echo "$volume_percent>100.00" | bc)" = "1" ] ; then #big volume critical
      volume_percent=$(echo "$volume_percent-100" | bc)
      dunstify "Volume" -h int:value:"$volume_percent" -h string:x-dunst-stack-tag:system -t 800 -u critical
   else
   dunstify "Volume" -h int:value:"$volume_percent" -h string:x-dunst-stack-tag:system -t 800
   fi
}

#sets volume and calls notification function
case $1 in
   up)
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      send_notification
      # mpg123 --pitch -0.5 -f -4000 /etc/nixos/scripts/sounds/click.mp3
      ;;
   down)
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      send_notification
      # mpg123 --pitch -0.5 -f -4000 /etc/nixos/scripts/sounds/click.mp3
      ;;
   display)
      send_notification
      # mpg123 --pitch -0.5 -f -4000 /etc/nixos/scripts/sounds/click.mp3
      ;;
esac
