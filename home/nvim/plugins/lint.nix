{ config, pkgs, ... }:

{
  programs.nixvim.plugins.lint = {
    enable = true;
  };
}
