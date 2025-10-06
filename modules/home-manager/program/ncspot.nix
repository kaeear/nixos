{ config, lib, pkgs, ... }:
{
  programs.ncspot = {
    enable = true;
    settings = {
      flip_status_indicators = true;
      keybindings = {
        "s"="";
	"d"="";
	"Shift+s"="save";
	"Shift+d"="delete";
      };
      track_format = {
        left = "%title";
	center = "%artist";
	right = "%saved %duration";
      };
      theme = {
        title = "cyan";
	playing = "cyan";
	playing_selected = "yellow";
	highlight = "black";
	highlight_bg = "blue";
	statusbar_progress = "blue";
      };
    };
  };
}
