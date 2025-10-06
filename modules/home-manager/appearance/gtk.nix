{ config, pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    font = {
      package = pkgs.mononoki;
      name = "Mononoki";
      size = 14;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 32;
    };
    # iconTheme = {
    #   package = pkgs.papirus-icon-theme;
    #   name = "Papirus-Dark";
    # };
    # theme = {
    #   package = pkgs.juno-theme;
    #   name = "Juno";
    # };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
}
