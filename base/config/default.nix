{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

  zramSwap.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;
}
