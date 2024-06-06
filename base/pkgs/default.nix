{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
    gcc

    vim
    nh
    brightnessctl
    alacritty
    wget
    zathura
    git
    fastfetch
    firefox
    brave
    kitty
    discord
    yazi
    gnome.file-roller
    (jetbrains.plugins.addPlugins jetbrains.clion [ "ideavim" "nixidea" ])

    android-studio
    flutter
    jdk17

    vscode.fhs
    xfce.thunar
    bluetuith
    lm_sensors
    killall
    obsidian
    insomnia
    wallust
    delve
    go

    plex-media-player
    plexamp
    spotify

    blender

    mangohud
    lutris
    heroic
    bottles
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
}
