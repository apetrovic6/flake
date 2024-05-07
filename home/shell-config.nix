{ config, pkgs, ...}:
let
  shellAliases = {
    la = "ls -la";
    n = "nvim";
  };
  init = ''
          fastfetch -l nixos_old
          eval "$(zoxide init --cmd t zsh)"
	  '';
in
{
 programs.bash = {
  inherit shellAliases;
  initExtra = init;
  enable = true;
 };

 programs.zsh = {
  inherit shellAliases;
  completionInit = init;
  enable = true;
 };
}
