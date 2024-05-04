{ config, pkgs, ...}:

{

  environment.shells = with pkgs; [ bash zsh ];
  users.defaultUserShell = pkgs.zsh;
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "web-search" "copypath" "copyfile" "copybuffer" "dirhistory" "podman"];
      theme = "agnoster";
    };
  };
}
