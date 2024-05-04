{ config, pkgs, ...}:
{
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    
    powerManagement.finegrained = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
