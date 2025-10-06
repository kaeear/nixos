{ pkgs, lib, config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "/home/kae/.wallpaper/wallpaper.png";
      wallpaper = "eDP-1,/home/kae/.wallpaper/wallpaper.png";
    };
  };
}
