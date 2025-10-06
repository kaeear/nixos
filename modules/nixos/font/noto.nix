{ config, lib, pkgs, ... }:
{
  options = {
    font-noto.enable =
      lib.mkEnableOption "enables noto fonts";
  };

  config = lib.mkIf config.font-noto.enable {
    fonts.packages = with pkgs; [
      notonoto
      noto-fonts
      noto-fonts-monochrome-emoji
    ];
  };
}
