{ config, lib, pkgs, ... }:
{
  options = {
    pipewire.enable = 
      lib.mkEnableOption "enables pipewire module";
  };

  config = lib.mkIf config.pipewire.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
