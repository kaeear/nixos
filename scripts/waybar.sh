#!/run/current-system/sw/bin/bash

function get_current_state {
  muted=$(/home/kae/.scripts/mute.sh print_state)
  controller=$(/home/kae/.scripts/controller.sh print_state)
  if [ "$muted" = "1" ] ; then mute_icon="󰍭" ; fi
  if [ "$controller" = "1" ] ; then controller_icon="󰊴" ; fi
  icons=( "$controller_icon" "$mute_icon" )
  echo ${icons[*]}

}

case $1 in
   focus)
      cp -rf /home/kae/.config/waybar/theme/focus/* /home/kae/.config/waybar/
      killall waybar
      waybar
      ;;
   normal)
      cp -rf /home/kae/.config/waybar/theme/normal/* /home/kae/.config/waybar/
      killall waybar
      waybar
      ;;
    request_icons)
      get_current_state
esac

current_theme=$(head -1 ~/.config/waybar/style.css)
echo $current_theme

