{ config, lib, pkgs, ... }:
{
  options = {
    nvim-catppuccin.enable = lib.mkEnableOption "enables catppuccin theme in nvim";
  };
  config = lib.mkIf config.nvim-catppuccin.enable {
    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
      ];
      extraConfig = ''
        colorscheme catppuccin-mocha
      '';
    };
  };
}
