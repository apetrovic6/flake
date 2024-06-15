{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  services.samba = {
    enable = true;
    securityType = "user";
  };
}
