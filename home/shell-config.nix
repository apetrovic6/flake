{ config, pkgs, ...}:
let
  shellAliases = {
    la = "ls -la";
    n = "nvim";
  };
  fetch = "fastfetch -l nixos_old";
in
{
 programs.bash = {
  inherit shellAliases;
  initExtra = fetch;
  enable = true;
 };

 programs.zsh = {
  inherit shellAliases;
  completionInit = fetch;
  enable = true;
 };
}
