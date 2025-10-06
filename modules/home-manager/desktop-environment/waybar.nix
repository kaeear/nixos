{ config, lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	positon = "top";
	output = [ "eDP-1" ];
	height = 40;
	spacing = "0";
	modules-left = [ "hyprland/workspaces" ];
	modules-center = [ "clock" ];
	modules-right = [ "custom/battery" "custom/power" ];
        "hyprland/workspaces" = {
	  disable-scroll = true;
	  all-outputs = false;
	  format = "{icon}";
	  persistent-workspaces = {
	    "eDP-1" = [
            1
	    2
	    3
	    4
	    5
	    ];
	  };
	  format-icons = {
	    default = "";
	    visible = "";
	    active = "";
	  };
	};
	"clock" = {
          tooltip = true;
	  tooltip-format = "{:L%d %b%n%A}";
          align = 0.5;
	};
	"custom/battery" = {
	  return-type = "json";
	  exec = "/etc/nixos/scripts/battery.sh get_icon";
	  format = "{}";
	  interval = 5;
	  signal = 1;
	};
	"custom/power" = {
	  format = "{icon}⏻";
	  tooltip = false;
          menu = "on-click";
	  menu-file = "/etc/nixos/scripts/power_menu.xml";
	  menu-actions = {
	    shutdown = "poweroff";

	    reboot = "reboot";
	  };
	};
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Mononoki", "Nerd Font Propo";
        font-weight: bold;
        font-size: 22px;
        min-height: 28px;
        }
      
      #waybar {
        background-color: rgba(30, 30, 46, 1.0);
        box-shadow: none;
        min-height: 16px;
        padding: 0px;
      }
      
      #workspaces {
        background-color: rgba(15, 19, 54, 0);
        border: 0px solid rgba(15, 19, 54, 0);
        border-radius: 15px;
        border-width: 4px;
        padding: 0 0 0 0px;
	margin: 0px
      }
      
      #workspaces button:hover {
        color: rgba(255, 224, 241, 1);
        border-bottom: 3px solid rgba(30, 30, 46, 1);
        transition-duration: 0.s;
        transition-property: border-bottom, color;
        background: none;
        box-shadow: none;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button.visible:hover {
        color: rgba(255, 224, 241, 1);
        border-bottom: 3px solid rgba(69, 71, 90, 1);
        transition-duration: 0.s;
        transition-property: border-bottom, color;
        background: none;
        box-shadow: none;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button.active:hover {
        color: rgba(255, 224, 241, 1);
        border-bottom: 3px solid rgba(245, 194, 231, 1);
        transition-duration: 0.s;
        transition-property: border-bottom, color;
        background: none;
        box-shadow: none;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button.empty:hover {
        color: rgba(169, 171, 190, 1);
        transition-duration: 0.s;
        transition-property: border-bottom, color;
        background: none;
        box-shadow: none;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button {
        color: rgba(245, 194, 231, 1);
        border-bottom: 3px solid rgba(30, 30, 46, 1.0);
        transition-property: border-bottom, color;
        transition-duration: 0.3s;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button.visible {
        color: rgba(245, 194, 231, 1);
        border-bottom: 3px solid rgba(69, 71, 90, 1);
        transition-property: border-bottom, color;
        transition-duration: 0.3s;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button.active {
        color: rgba(245, 194, 231, 1);
        border-bottom: 3px solid rgba(245, 194, 231, 1);
        transition-property: border-bottom, color;
        transition-duration: 0.3s;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #workspaces button.empty {
        color: rgba(69, 71, 90, 1);
        transition-property: border-bottom, color;
        transition-duration: 0.3s;
        padding: 0 4 0 3px;
        margin: 0 9 0 0px;
      }
      
      #clock {
        color: rgba(137, 180, 250, 1);
        background-color: rgba(253, 152, 1, 0);
        border: 1px solid rgba(242, 119, 36, 0);
        border-radius: 15px;
        border-width: 4px;
        font-size: 22px;
        font-weight: 600;
        padding: 0 0 0 0px;
      }
      tooltip {
        color: rgba(137, 180, 250, 1);
        background-color: rgba(30, 30, 46, 1);
        border-radius: 15px;
        border-width: 0px;
        text-shadow: none;
      }
      #custom-battery {
        background-color: rgba(27, 36, 90, 0);
        border: 1px solid rgba(15, 19, 54, 0);
        border-radius: 15px;
        border-width: 4px;
        color: rgba(166, 227, 161, 1);
        font-size: 20px;
        padding: 0 9 0 0px;
      }
      #custom-battery.green{
        color: rgba(166, 227, 161, 1);
      }
      #custom-battery.yellow{
        color: rgba(249, 226, 175, 1);
      }
      #custom-battery.red{
        color: rgba(243, 139, 168, 1);
      }
      #custom-power {
        background-color: rgba(27, 36, 90, 0);
        border: 1px solid rgba(15, 19, 54, 0);
        border-radius: 15px;
        border-width: 4px;
        color: rgba(166, 227, 161, 1);
        font-size: 18px;
        padding: 0 9 0 0px;
        margin: 5 0 0 0px;
      }
      #custom-statusicons {
        background-color: rgba(27, 36, 90, 0);
        border: 1px solid rgba(15, 19, 54, 0);
        border-radius: 15px;
        border-width: 4px;
        color: rgba(166, 227, 161, 1);
        font-size: 18px;
        padding: 0 9 3 0px;
      }
      menu {
        border-radius: 15px;
        border: 0px solid rgba(30, 30, 46, 1);
        background-color: rgba(30, 30, 46, 1);
        color: rgba(243, 139, 168, 1);
      }
      menuitem {
        border-radius: 15px;
      }
    '';
  };
}


