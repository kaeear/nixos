{ config, lib, pkgs, inputs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
}
