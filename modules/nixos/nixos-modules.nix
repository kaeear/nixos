{ config, pkgs, lib, ... }:
{
  imports = [
    ./system/pipewire.nix
    ./system/network.nix
    ./system/users.nix
    ./system/bluetooth.nix
    ./system/system-settings.nix
    ./system/zsh.nix
    ./system/keyd.nix
    ./system/grub.nix
    ./programs/firefox.nix
    ./programs/steam.nix
    ./programs/prism-launcher.nix
    ./programs/live-server.nix
    ./font/mononoki.nix
    ./font/symbols.nix
    ./font/noto.nix
  ];
  pipewire.enable = lib.mkDefault true;
  keyd.enable = lib.mkDefault false;
  grub.enable = lib.mkDefault true;
  font-mononoki.enable = lib.mkDefault false;
  font-symbols.enable = lib.mkDefault true;
  font-noto.enable = lib.mkDefault true;
  steam.enable = lib.mkDefault false;
  minecraft.enable = lib.mkDefault false;
  live-server.enable = lib.mkDefault false;
}
