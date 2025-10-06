{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./thinkpad-graphics.nix
    ];
  
  # Custom Settings #
  grub.enable = true; # default true
  pipewire.enable = true; # default true
  # nvim.enable = true; # default true
  keyd.enable = true; # default false
  # Fonts
  font-mononoki.enable = true; # default false
  font-symbols.enable = true; # default true
  font-noto.enable = true; # default true
  # Games
  steam.enable = true; # default false (unfree)
  minecraft.enable = true; # default false
  live-server.enable = true; # default false

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nano
    wget
    git
    bash # language for scripts
    mpg123 # sounds for scripts
    bc # math for scripts
    psmisc # adds killall
    fastfetch
    btop
    brightnessctl
    wev # lets you see keycodes
    rtkit # i think it makes realtime audio changes work but maybe not needed
    vulkan-tools # vkcube o-o
    alsa-utils
    yazi
    p7zip
    tmux 
    gcc # for c programming
  ];

  users.users.kae.packages = with pkgs; [
    gimp3
    discord
    hyprshot
    hyprpicker
    feh
    mpv
    hakuneko
    mangareader
    pavucontrol
    tor-browser
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs; };
    users = {
      "kae" = import ./home.nix;
    };
  };

  services.upower.enable = true;

  services.openssh.enable = true;
  system.stateVersion = "25.11"; # Did you read the comment?

}

