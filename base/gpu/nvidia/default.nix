{ config, pkgs, ...}:
{

  hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    
    powerManagement.finegrained = false;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
