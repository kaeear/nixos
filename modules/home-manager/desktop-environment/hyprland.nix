{ pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "monitor" = "eDP-1,1920x1080@60.04900,0x0,1.00";
      "$mod" = "SUPER";
      "$enable_touch" = "true";

      "exec-once" = [
        "waybar"
	"hyprpaper"
	"hyprctl setcursor Bibta-Modern 32"
      ];

      bind = [
        "$mod, M, exec, alacritty"
	"$mod, R, exec, fuzzel"
	"$mod, X, exec, hyprshot -m region"
	"$mod, V, togglefloating,"
        "$mod, S, togglesplit,"
	"$mod, F, fullscreen,"
        "$mod SHIFT, Q, killactive,"
	"$mod SHIFT, Y, exit,"

	"$mod, Tab, exec, pkill -SIGUSR1 waybar || waybar"
	"$mod SHIFT, Tab, exec, /etc/nixos/scripts/gaps.sh"
	 
        "$mod, code:35, exec, /etc/nixos/scripts/volume.sh up"
        "$mod, code:34, exec, /etc/nixos/scripts/volume.sh down"

        "$mod, code:51, exec, /etc/nixos/scripts/brightness.sh up"
        "$mod, code:48, exec, /etc/nixos/scripts/brightness.sh down"

        "$mod, code:65, exec, /etc/nixos/scripts/touch.sh"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

      device = [
        {
          name = "synaptics-tm2964-001";
          enabled = "$enable_touch";
        }
        {
          name = "tpps/2-ibm-trackpoint";
          enabled = "$enable_touch";
        }
      ];
      input = {
        "kb_layout" = "us";
        "follow_mouse" = "1";
	"sensitivity" = "0";
      };

      general = {
        "gaps_in" = "5";
	"gaps_out" = "10";

	"border_size" = "3";

        "col.active_border" = "rgba(89b4faff)";
	"col.inactive_border" = "rgba(595959ff)";
        "resize_on_border" = "false";
	"allow_tearing" = "false";
	"layout" = "dwindle";
      };

      decoration = {
        "rounding" = "5";
	"rounding_power" = "2";
	"active_opacity" = "1.0";
	"inactive_opacity" = "1.0";

        shadow = {
          "enabled" = "false";
        };
        
        blur = {
          "enabled" = "true";
          "size" = "3";
	  "passes" = "1";
	  "vibrancy" = "0.1696";
        };
      };

      animations = {
        "enabled" = "yes";

	bezier = [
	  "easeOutQuint,0.23,1,0.32,1"
	  "easeInOutCubic,0.65,0.05,0.36,1"
	  "linear,0,0,1,1"
	  "almostLinear,0.5,0.5,0.75,1.0"
	  "quick,0.15,0,0.1,1"
	];

        animation = [
	  "global, 1, 10, default"
	  "border, 1, 5.39, easeOutQuint"
	  "windows, 1, 4.79, easeOutQuint"
	  "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
	  "windowsOut, 1, 1.49, linear, popin 87%"
	  "fadeIn, 1, 1.713, almostLinear"
	  "fadeOut, 1, 1.46, almostLinear"
	  "fade, 1, 3.03, quick"
	  "layers, 1, 3.81, easeOutQuint"
	  "layersIn, 1, 4, easeOutQuint, fade"
	  "layersOut, 1, 1.5, easeOutQuint, fade"
	  "fadeLayersIn, 1, 1.79, almostLinear"
	  "fadeLayersOut, 1, 1.39, almostLinear"
	  "workspaces, 1, 1.94, almostLinear, fade"
	  "workspacesIn, 1, 1.21, almostLinear, fade"
	  "workspacesOut, 1, 1.94, almostLinear, fade"
	];
      };   

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
      "cursor:inactive_timeout" = "1";

      "ecosystem:no_update_news" = "true";
    };
  };
}
