{ config, lib, pkgs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./clipboard.nix
    ./settings.nix
    ./colors.nix
    ./syntax.nix
  ];
  

  options = {
    nvim.enable = lib.mkEnableOption "enables nvim";
  };
  config = lib.mkIf config.nvim.enable {
    nvim-catppuccin.enable = true; 
    nvim-clipboard.enable = true;
    nvim-settings.enable = true;
    nvim-colors.enable = true;
    nvim-syntax.enable = true;
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
