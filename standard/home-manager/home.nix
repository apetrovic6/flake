# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "apetrovic";
    homeDirectory = "/home/apetrovic";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
   home.packages = with pkgs; [ steam devenv yazi zellij ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "apetrovic6";
    userEmail = "petrovicante6@gmail.com";
  };

  programs.zellij = {
  	enable = true;
  	enableBashIntegration = true;
	enableZshIntegration = true;
	
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };

    # Allow insecure .NET 6
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
