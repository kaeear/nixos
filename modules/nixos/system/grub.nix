{ config, lib, pkgs, ... }:
{
  options = {
    grub.enable = 
      lib.mkEnableOption "enables grub bootloader";
  };

  config = lib.mkIf config.grub.enable {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
  };
}
