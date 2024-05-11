{ pkgs, ... }:
{
  home.packages = with pkgs; [
    btop
    bat
    fastfetch
    killall
    gnugrep
    rsync
    unzip
    zip
    vim
    neovim
  ];
}
