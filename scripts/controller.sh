#!/run/current-system/sw/bin/bash

function detect_program {
  program_data=$(ps -e | grep antimicrox)
  if [ "$program_data" = "" ] ; then
    is_active=0
  else
    is_active=1
  fi
}

function close_profile {
  killall antimicrox
}

function select_navigation_profile {
  killall antimicrox
  antimicrox --profile /home/kae/.scripts/controller/profiles/navigation.joystick.amgp --hidden &
}

function toggle_navigation_profile {
  if [ "$is_active" = "1" ] ; then
    close_profile
  else
    select_navigation_profile
  fi
}

function send_notification {
    if [ "$is_active" = "1" ] ; then
      dunstify "󰊴 Enabled" -h string:x-dunst-stack-tag:system -t 800
    else
      dunstify "󰊵 Disabled" -h string:x-dunst-stack-tag:system -t 800
    fi
}

function play_sound {
    if [ "$is_active" = "1" ] ; then
      mpg123 -f -6000 /etc/nixos/scripts/sounds/beep_up.mp3 &
    else
      mpg123 -f -6000 /etc/nixos/scripts/sounds/beep_down.mp3 &
      oo
    fi
}

case $1 in
  toggle_profile)
    detect_program
    toggle_navigation_profile
    sleep 0.5
    detect_program
    send_notification
    play_sound
    ;;
  navigation_profile)
    select_navigation_profile
    ;;
  close)
    close_profile
    ;;
  print_state)
    detect_program
    echo $is_active
    ;;
esac
