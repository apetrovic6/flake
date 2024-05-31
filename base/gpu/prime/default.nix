{ config, lib, pkgs, ... }:

{
  hardware.nvidia.powerManagement.finegrained = true;
  hardware.nvidia.prime = {

    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    intelBusId = "PCI:0:0:2";
    nvidiaBusId = "PCI:0:1:0";
  };

   specialisation = {
     gaming-time.configuration = {
       hardware.nvidia = {
         prime.sync.enable = lib.mkForce true;
	 prime.offload = {
           enable = lib.mkForce false;
	   enableOffloadCmd = lib.mkForce false;
	 };
       };
     };
   };
}
