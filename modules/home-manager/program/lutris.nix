{ config, lib, pkgs, ... }:
{
  options = {
    lutris.enable = lib.mkEnableOption "enables mangohud";
  };
  config = lib.mkIf config.lutris.enable {
    programs.lutris.enable = true;
  };
}
