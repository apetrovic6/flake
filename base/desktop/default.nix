{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the COSMIC DE.
  services.desktopManager.cosmic.enable = true;
  #  services.displayManager.cosmic-greeter.enable = true;
  #   services.xserver.displayManager.gdm.enable = true;
  #   services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
