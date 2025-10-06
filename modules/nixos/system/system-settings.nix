{ config, lib, pkgs, ... }:
{
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  services.xserver.xkb.layout = "us";
  #to boot into tty (pls)
  services.xserver.enable = false;
  programs.dconf.enable = true; # added for home-manager/gtk.nix to work "ca.desrt.dconf was not provided"
}
