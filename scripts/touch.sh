#!/run/current-system/sw/bin/bash

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    printf "enabled" > "$STATUS_FILE"
    dunstify "󰈷 Enabled" -h string:x-dunst-stack-tag:system -t 800
    hyprctl keyword "\$enable_touch" true 
    hyprctl keyword device:a ''
}

disable_touchpad() {
    printf "disabled" > "$STATUS_FILE"
    dunstify "󰺱 Disabled" -h string:x-dunst-stack-tag:system -t 800
    hyprctl keyword "\$enable_touch" false
    hyprctl keyword device:a ''
}

if ! [ -f "$STATUS_FILE" ]; then
  disable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "enabled" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "disabled" ]; then
    enable_touchpad
  fi
fi
