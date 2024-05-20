{ config, pkgs, ... }:

{
  services = {
    tailscale.enable = true;
  };


  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
}


