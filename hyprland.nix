{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    fuzzel
    polkit_gnome
    wlr-randr
    wl-clipboard
    hyprland-protocols
    swww
    hyprlock
    hypridle
    hyprcursor
    hyprdim
    pavucontrol
    pamixer
    grim
    slurp
    waybar
  ];
}
