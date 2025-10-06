#!/run/current-system/sw/bin/bash

function check_if_muted {
  volume=$(wpctl get-volume @DEFAULT_SOURCE@ | awk '{print $2}')
  if [ "$volume" = "0.00" ] ; then
    is_muted=1
  else
    is_muted=0
  fi 
}

function send_notification {
  if [ "$is_muted" = "1" ] ; then
    dunstify "󰍭 Muted" -h string:x-dunst-stack-tag:system -t 800
  else
    dunstify "󰍬 Activated" -h string:x-dunst-stack-tag:system -t 800
  fi
}

function play_sound {
  if [ "$is_muted" = "1" ] ; then
    mpg123 -f -3000 -o alsa /etc/nixos/scripts/sounds/microphone-muted.mp3
  else
    mpg123 -f -3000 -o alsa /etc/nixos/scripts/sounds/microphone-activated.mp3
  fi
}

function toggle_source_volume {
  check_if_muted
  if [ "$is_muted" = "1" ] ; then
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1
  else
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 0
  fi
}

case $1 in
  toggle)
    toggle_source_volume
    check_if_muted
    send_notification
    play_sound
    ;;
  display)
    send_notification
    ;;
  print_state)
    check_if_muted
    echo $is_muted
esac
