{ config, lib, pkgs, ... }:
{
  options = {
    mangohud.enable = lib.mkEnableOption "enables mangohud";
  };
  config = lib.mkIf config.mangohud.enable {
    programs.mangohud = {
      enable = true;
      settings = {
	fps_limit = 60;
	fps = true;
	show_fps_limit = true;
	frametime = true;
	frame_timing = true;
	gpu_stats = true;
        gpu_temp = true;
	gpu_list = [ 0 1 ];
	vram = true;
	cpu_stats = true;
	cpu_temp = true;
	ram = true;
	toggle_hud = "Shift_L+F6";
	toggle_fps_limit = "Shift_L+F7";
      };
    };
  };
}
