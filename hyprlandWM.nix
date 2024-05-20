{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

#  environment.sessionVariables.NIXOS_OZONE_WL = "1";
#  environment.sessionVariables.LIBVA_DRIVER_NAME= "nvidia";
#  environment.sessionVariables.XDG_SESSION_TYPE= "wayland";
#  environment.sessionVariables.GBM_BACKEND= "nvidia-drm";
#  environment.sessionVariables.__GLX_VENDOR_LIBRARY_NAME= "nvidia";

  environment.systemPackages = with pkgs; [
#    fuzzel
    rofi-wayland
    xdg-desktop-portal-hyprland
   polkit_gnome
    wlr-randr
    wl-clipboard
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
