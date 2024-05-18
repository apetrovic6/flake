{ config, pkgs, ...}:
{
  hardware.opengl = {
    extraPackages = with pkgs; [
     intel-media-driver
     libvdpau-va-gl
    ];
  };
  
   nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };
}
