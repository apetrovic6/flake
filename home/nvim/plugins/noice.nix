{ config, pkgs, ... }:

{
  programs.nixvim.plugins.noice = {
    enable = true;

    cmdline.enabled = true;
    health.checker = true;
  };
}
