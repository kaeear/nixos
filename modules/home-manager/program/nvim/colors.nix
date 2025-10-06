{ config, lib, pkgs, ... }:
{
  options = {
    nvim-colors.enable = lib.mkEnableOption "enables color preview in nvim";
  };
  config = lib.mkIf config.nvim-colors.enable {
    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        vim-hexokinase
      ];
      extraConfig = ''
        let g:Hexokinase_highlighters = ['virtual']
      '';
    };
  };
}
