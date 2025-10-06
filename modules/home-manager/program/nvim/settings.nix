{ config, lib, pkgs, ... }:
{
  options = {
    nvim-settings.enable = lib.mkEnableOption "enables custom settings for nvim";
  };
  config = lib.mkIf config.nvim-settings.enable {
    programs.neovim = {
      extraConfig = ''
        set number 
      	set noautoindent
        set nosmartindent
        set paste
	      set expandtab
        set shiftwidth=2
        set tabstop=2
      '';
    };
  };
}
