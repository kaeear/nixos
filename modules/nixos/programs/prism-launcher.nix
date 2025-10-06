{ config, lib, pkgs, ... }:
{
  options = {
    minecraft.enable = lib.mkEnableOption "enables minecraft through prismlauncher";
  };

  config = lib.mkIf config.minecraft.enable {
    users.users.kae.packages = with pkgs; [
      prismlauncher
    ];
  };
}
