#!/run/current-system/sw/bin/bash

function define_lists {
  energy_level_icons=(
    "󰁹"
    "󰂂"
    "󰂁"
    "󰂀"
    "󰁿"
    "󰁾"
    "󰁽"
    "󰁼"
    "󰁻"
    "󰁺"
    "󱃍"
  )
  charging_level_icons=(
    "󰂅"
    "󰂋"
    "󰂊"
    "󰢞"
    "󰂉"
    "󰢝"
    "󰂈"
    "󰂇"
    "󰂆"
    "󰢜"
    "󰢟"
  )
  levels=(
    100
    95
    85
    75
    65
    55
    45
    35
    27
    19
    10
  )
}

function get_current_stats {
  current_power=$(</sys/class/power_supply/BAT0/capacity)
  current_status=$(</sys/class/power_supply/BAT0/status)
  if [ "$current_status" = "Charging" ] ; then
    is_charging=1
  else
    is_charging=0
  fi
}

function get_current_icon {
  if [ "$is_charging" = "1" ] ; then
    for ((i=0; i<11; i++)); do
      if [ "$current_power" -le "${levels[$i]}" ] ; then
        current_icon="${charging_level_icons[i]}"
      fi
    done
  else
    for ((i=0; i<11; i++)); do
      if [ "$current_power" -le "${levels[$i]}" ] ; then
        current_icon="${energy_level_icons[i]}"
      fi
    done
  fi
}

function get_color {
  if [ "$is_charging" = "1" ] ; then
    color_class="green"
  elif [ "$current_power" -gt "40" ] ; then
    color_class="green"
  elif [ "$current_power" -gt "15" ] ; then
    color_class="yellow"
  else
    color_class="red"
  fi
}

function send_message {
  export STATUS_FILE="$XDG_RUNTIME_DIR/battery.status"
  if ! [ -f "$STATUS_FILE" ]; then
    printf "not-been-warned" > "$STATUS_FILE"
  else
    if [ "$current_power" -gt "10" ] && [ $(cat "$STATUS_FILE") = "been-warned" ]; then
      printf "not-been-warned" > "$STATUS_FILE"
      echo notbeenwarned
    elif [ "$current_power" -le "10" ] && [ $(cat "$STATUS_FILE") = "not-been-warned" ]; then
      dunstify "󱃍 Battery Low!" -h string:x-dunst-stack-tag:system -t 8000 -u critical
      printf "been-warned" > "$STATUS_FILE"
      echo WARNING
    fi
  fi
}

case $1 in
  test)
    define_lists
    get_current_stats
    get_current_icon
    echo $current_power
    echo $current_status
    echo $current_icon
    ;;
  get_icon)
    define_lists
    get_current_stats
    get_current_icon
    get_color
    send_message
    echo "{\"text\": \"$current_icon\", \"class\": \"$color_class\", \"tooltip\": \"$current_power%\"}"
esac
