{ config, lib, pkgs, ... }:
{
  options = {
    nvim-live-preview.enable = lib.mkEnableOption "enables live-preview plugin in nvim";
  };
  config = lib.mkIf config.nvim-live-preview.enable {
    home.packages = [
     pkgs.nodejs 
     pkgs.nodePackages.live-server
    ];
  };
}
