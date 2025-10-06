{ config, lib, pkgs, ... }:
{
  imports = [
    ./nixos/nixos-modules.nix
    ./home-manager/home-manager-modules.nix
  ];
}
