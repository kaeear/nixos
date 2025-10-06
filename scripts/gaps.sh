#!/run/current-system/sw/bin/bash

gaps_in=$(hyprctl -j getoption general:gaps_in | awk '{print $4}' ) 

if [ "$gaps_in" = "\"0" ]
then
   hyprctl keyword general:gaps_in 4
   hyprctl keyword general:gaps_out 8
   hyprctl keyword general:border_size 3
   hyprctl keyword general:col.inactive_border 0xff45475a
   hyprctl keyword decoration:rounding 10
else
   hyprctl keyword general:gaps_in 0
   hyprctl keyword general:gaps_out 0
   hyprctl keyword general:border_size 2
   hyprctl keyword general:col.inactive_border 0xff45475a
   hyprctl keyword decoration:rounding 0
fi
