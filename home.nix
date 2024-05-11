{ config, pkgs, ... }:

{
  home.username = "sascha";
  home.homeDirectory = "/home/sascha";

  programs.home-manager.enable = true;
  
  imports = [
    ./user/base-pkgs.nix
  ];

  home.stateVersion = "23.11";

  home.packages = (with pkgs; [
    zsh
    git
    neovim
    kitty
    alacritty
  ]);

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Media/Music";
      videos = "${config.home.homeDirectory}/Media/Videos";
      pictures = "${config.home.homeDirectory}/Media/Pictures";
      templates = "${config.home.homeDirectory}/Templates";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      desktop = null;
      publicShare = null;
      extraConfig = {
        XDG_NIXCONF_DIR = "${config.home.homeDirectory}/.nixconf";
        XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
        XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
        XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
        XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      };
    };
  };

  news.display = "silent";
}
