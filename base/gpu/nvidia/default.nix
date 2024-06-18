{ config, pkgs, lib, ... }: {

  boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;

    powerManagement.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
