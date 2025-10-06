{ config, lib, pkgs, ... }:
{
  options = {
    keyd.enable =
      lib.mkEnableOption "enables custom virtual keyboard";
  };

  config = lib.mkIf config.keyd.enable {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
	  ids = [ "*" ];
	  settings = {
            main = {
	      capslock = "layer(caps)";
	      leftalt = "leftmeta";
	      leftmeta = "leftalt";
	    };
	    caps = {
	      h = "left"; 
	      j = "down";
	      k = "up";
	      l = "right";
	      q = "escape";
            };
	  };
	};
      };
    };
  };
}
