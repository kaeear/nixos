{ config, lib, pkgs, ... }:
{
  options = {
    font-mononoki.enable =
      lib.mkEnableOption "enables mononoki font";
  };

  config = lib.mkIf config.font-mononoki.enable {
    fonts.packages = with pkgs; [
      mononoki
    ];
  };
}
