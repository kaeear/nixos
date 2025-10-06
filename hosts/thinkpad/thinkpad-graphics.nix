{ config, pkgs, lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    graphics.extraPackages = with pkgs; [ mesa];
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
      prime = {
        intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:2:0:0";
	sync.enable = true;
	offload.enable = false;
      };
    };
  };
}
