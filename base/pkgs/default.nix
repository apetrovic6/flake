{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pciutils
    gcc

    vim
    brightnessctl
    neovim
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
