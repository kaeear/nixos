{ config, lib, pkgs, ... }:
{
  imports = [
    ./desktop-environment/hyprland.nix
    ./desktop-environment/hyprpaper.nix
    ./desktop-environment/waybar.nix
    ./desktop-environment/dunst.nix
    ./desktop-environment/fuzzel.nix
    ./terminal/alacritty.nix
    ./program/mangohud.nix
    ./program/spotify-player.nix
    ./program/nvim/nvim.nix
    ./program/lutris.nix
    ./appearance/bibita-modern.nix
    ./appearance/gtk.nix
  ];
  mangohud.enable = lib.mkDefault false;
  spotify-player.enable = lib.mkDefault false;
  nvim.enable = lib.mkDefault true;
  nvim-catppuccin.enable = lib.mkDefault false;
  nvim-clipboard.enable = lib.mkDefault false;
  nvim-settings.enable = lib.mkDefault false;
  nvim-colors.enable = lib.mkDefault false;
  nvim-syntax.enable = lib.mkDefault false;
  lutris.enable = lib.mkDefault false;
}
