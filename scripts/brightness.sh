#!/run/current-system/sw/bin/bash

#gives dustify as output depending on volume
function get_brightness {
  brightness=$(brightnessctl | grep % | awk '{print $4}' | tr -d "(%)")
}

function play_sound {
  mpg123 --pitch -0.5 -f -4000 /etc/nixos/scripts/sounds/click.mp3
}

function send_notification {
  dunstify "Brightness" -h int:value:"$brightness" -h string:x-dunst-stack-tag:system -t 800
}

function prevent_blindness {
  if [ "$brightness" = "0" ] ; then
    brightnessctl set 1
  fi
}

function decrease_safely {
  if [ "$brightness" -le "5" ] ; then
    brightnessctl set 1
  else
    brightnessctl set 5%-
  fi
}
#sets volume and calls notification function
case $1 in
  up)
    brightnessctl set +5%
    get_brightness
    send_notification
    # play_sound
    ;;
  down)
    get_brightness
    decrease_safely
    get_brightness
    send_notification
    # play_sound
    ;;
  display)
    get_brightness
    send_notification
    ;;
esac
