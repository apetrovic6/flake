{ config, pkgs, ...}:

{
  boot = {
    kernelParams = [
     "intel_iommu=on"
    ];

    kernelModules = [
      "kvm-intel"
      "vfio-pci"
      "nvidia-uvm"
    ];
  };
}
