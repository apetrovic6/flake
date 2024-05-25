{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pciutils
    gcc

    vim
    brightnessctl
    alacritty
    wget
    git
    fastfetch
    firefox
    brave
    kitty
    discord
    gnome.file-roller
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.clion ["ideavim" "nixidea"])
    vscode.fhs 
    xfce.thunar
    bluetuith
    lm_sensors

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
