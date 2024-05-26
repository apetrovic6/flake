{ config, pkgs, ... }:

{
  services = {
    tailscale.enable = true;
  };

  powerManagement.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
}


