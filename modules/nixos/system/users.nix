{ config, lib, pkgs, ... }:
{
  users.users.kae = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    home = "/home/kae";
  };
}
