{ config, lib, pkgs, ... }:
{
  options = {
    nvim-syntax.enable = lib.mkEnableOption "enables syntax for programming languages in nvim";
  };
  config = lib.mkIf config.nvim-syntax.enable {
    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        (nvim-treesitter.withPlugins (p: [ p.c ]))
      ];
      extraConfig = ''
        lua << EOF
        require'nvim-treesitter.configs'.setup {
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
        EOF
      '';
    };
  };
}
