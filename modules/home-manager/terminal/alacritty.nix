{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    settings = {
      window.padding = {
        x = 10;
        y = 10;
      };
      font = {
        normal = {
          family = "mononoki";
          style = "Regular";
        };
        size = 14.5;
      };
    };
  };
}
