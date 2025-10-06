{ config, lib, pkgs, ... }:
{
  options = {
    steam.enable =
      lib.mkEnableOption "enables steam";
  };

  config = lib.mkIf config.steam.enable {

    environment.systemPackages = with pkgs; [
      protonup
    ];

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;
    
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

  };
}
