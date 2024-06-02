{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

  zramSwap.enable = true;

  nix.gc.automatic = true;
  nix.settings.auto-optimise-store = true;
}
