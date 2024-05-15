{ config, pkgs, ...}:

{
    boot.kernelModules = [ "vfio" "vfio_pci" "vfio_iommu_type1" ];
    boot.kernelParams = [ "intel_iommu=on" "iommu=pt" ]; 
}
