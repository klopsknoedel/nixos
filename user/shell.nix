{ pkgs, ... }:

let
  shellAliases = {
    ls = "eza --icons --group-directories-first -Tla -L=1";
    cat = "bat";
    htop = "btop";
  };

in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = shellAliases;
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      size = 1000000;
    };

    oh-my-zsh= {
      enable = true;
      theme = "bureau";
   };
  };

  home.packages = with pkgs; [
    eza
    direnv
    nix-direnv
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
