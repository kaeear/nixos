{ config, lib, pkgs, ... }:
{
  options = { live-server.enable = lib.mkEnableOption "enables live-sever for html preview";
  };

  config = lib.mkIf config.live-server.enable {

    environment.systemPackages = with pkgs; [
      nodejs
      nodePackages.live-server
    ];
  };
}
