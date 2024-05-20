{ config, pkgs, ...}:
let
  shellAliases = {
    la = "ls -la";
    n = "nvim";
  };
  init = ''
          fastfetch -l nixos_old
	  '';
in
{
 programs.bash = {
  inherit shellAliases;
  initExtra = init + "eval \"$(zoxide init --cmd t bash)\"";
  enable = true;
 };

 programs.zsh = {
  inherit shellAliases;
  completionInit = init + "eval \"$(zoxide init --cmd t zsh)\"";
  enable = true;
 };
}
