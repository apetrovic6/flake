{ config, pkgs, ...}:
let
  shellAliases = {
    la = "ls -la";
    n = "nvim";
  };
  init = ''
          fastfetch -l nixos_old
	  '';

    zoxide_bash = "eval \"$(zoxide init --cmd t bash)\"";
    zoxide_zsh = "eval \"$(zoxide init --cmd t zsh)\"";
in
{
 programs.bash = {
  inherit shellAliases;
  initExtra = init + zoxide_bash;
  enable = true;
 };

 programs.zsh = {
  inherit shellAliases;
  completionInit = init + zoxide_zsh;
  enable = true;
 };
}
