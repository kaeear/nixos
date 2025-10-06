{ config, lib, pkgs, ... }:
{
  networking.hostName= "thinkpad";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.useDHCP = false;
  networking.dhcpcd.enable = false;
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];
}
