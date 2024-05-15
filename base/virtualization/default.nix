{ config, pkgs, ...}:

{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd = {
        enable = true;
       
        qemu = {
          ovmf.enable = true;
          swtpm.enable = true;
        };
      };
  };
  
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    dive
    podman-tui
    podman-compose
  ];
}
