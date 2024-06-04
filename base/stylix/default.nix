{ config, pkgs, ... }:

{
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  #stylix.image = /home/apetrovic/Pictures/Wallpapers/38.jpg;
  stylix.image = /home/apetrovic/Pictures/Wallpapers/2.jpg;

  stylix.polarity = "dark";

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 14;
    desktop = 12;
    popups = 10;
  };

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.8;
    desktop = 1.0;
    popups = 1.0;
  };

  stylix.targets.plymouth.enable = true;

}
