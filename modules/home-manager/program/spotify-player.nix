{ config, lib, pkgs, ... }:
{ 
  options = {
    spotify-player.enable = lib.mkEnableOption "enables spotify-player";
  };
  config = lib.mkIf config.spotify-player.enable {
    programs.spotify-player = {
      enable = true;
      # settings = {
      # };
    };
  };
}
