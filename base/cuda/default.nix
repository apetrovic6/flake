{ config, pkgs, ...}:

{
  nixpkgs.config = {
      cudaSupport = true;
    };
}
