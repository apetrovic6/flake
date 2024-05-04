{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

  zramSwap.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
