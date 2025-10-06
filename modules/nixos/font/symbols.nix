{ config, lib, pkgs, ... }:
{
  options = {
    font-symbols.enable =
      lib.mkEnableOption "enables font symbols";
  };

  config = lib.mkIf config.font-symbols.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
    ];
  };
}
