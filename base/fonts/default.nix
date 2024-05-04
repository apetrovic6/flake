{ config, pkgs, ...}:

{
  fonts.fontDir.enable = true;
  fonts.packages= with pkgs; [
    nerdfonts
    font-awesome
    google-fonts
  ];
}
