{ config, pkgs, lib, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Mononoki:size=32:weight=bold";
	lines = 5;
	width = 20;
	vertical-pad = 25;
	inner-pad = 5;
      };
      colors = {
        background = "1e1e2eff";
	border = "f5c2e7ff";
	selection = "f5c2e7ff";
	selection-text = "00000066";
	selection-match = "000000aa";
	match = "89b4faff";
	prompt ="89b4faff";
	input = "89b4faff"; 
	text = "ffffffff";
      };
      border = {
        width = 5;
      };
    };
  };
}
