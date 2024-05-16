# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, userSettings, systemSettings, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../hyprlandWM.nix 
      ../../base/boot
      ../../base/misc/zsa
      ../../base/networking
      ../../base/config
      ../../base/shell
      ../../base/asus
      ../../base/pkgs
      ../../base/gpu/intel
      ../../base/gpu/nvidia
      ../../base/gpu/prime
      ../../base/fonts
      ../../base/users
      ../../base/services
      ../../base/virtualization
      ../../base/virtualization/intel
      ../../base/virtualization/pci-passthrough
      ./hardware.nix
    ];

#  boot.kernelPackages = pkgs.linuxPackages_latest;
#  boot.kernelPackages = pkgs.linuxPackages_testing;

 boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_testing.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
            url = "https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/snapshot/sound-6.10-rc1.tar.gz";
            sha256 = "sha256-dd3QIge9qX6286gFBh/FumaCh23ZvQtgRO3Cew/i+iM=";
      };
      version = "6.10-rc1";
      modDirVersion = "6.9.0-rc5";
      };
  });

  programs.light.enable = true;


# services.thermald.enable = true;

# services.tlp = {
#  enable = false;
#  settings = {
#    CPU_SCALING_GOVERNOR_ON_AC = "performance";
#    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

#   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
#   CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

#    CPU_MIN_PERF_ON_AC = 0;
#    CPU_MAX_PERF_ON_AC = 100;
#    CPU_MIN_PERF_ON_BAT = 0;
    #CPU_MAX_PERF_ON_BAT = 50;

    # START_CHARGE_THRESH_BAT0 = 40;
    # STOP_CHARGE_THRESH_BAT0 = 80;
#  };
# };

 networking.hostName = systemSettings.hostname; # Define your hostname.
  

  nixpkgs.config = {
   cudaSupport = true;
  };

#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.`
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_IDENTIFICATION = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_NUMERIC = "hr_HR.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_TIME = "hr_HR.UTF-8";
  };
   

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
#  services.xserver.displayManager.gdm.enable = true;
#  services.xserver.desktopManager.gnome.enable = true;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes"];
}
