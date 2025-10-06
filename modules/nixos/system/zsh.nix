{ config, lib, pkgs, ... }:
{ programs.zsh = { enable = true;
    enableCompletion = true;
    autosuggestions.enable = false;
    syntaxHighlighting.enable = false;

    shellAliases = {
      v = "sudo -E nvim";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#thinkpad";
    };
    
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
    promptInit = ''
      export PS1=" %F{cyan}%~%B%F{blue} > %f%b"
    '';
  };
}
