{ config, lib, pkgs, ... }:
{
  options = {
    nvim-clipboard.enable = lib.mkEnableOption "enables system clipboard in nvim";
  };
  config = lib.mkIf config.nvim-clipboard.enable {
    home.packages = [
      pkgs.wl-clipboard
    ];
    programs.neovim = {
      extraConfig = ''
        set clipboard=unnamedplus
      '';
    };
  };
}
