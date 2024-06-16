{ config, pkgs, userSettings, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "Ante Petrovic";
    initialPassword = "12345";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "libvirtd"
      "video"
      "audio"
      "camera"
      "kvm"
      "plex"
      "scanner"
      "lp"
      "adbusers"
    ];
    packages = with pkgs;
      [

      ];
  };

  nix.settings.trusted-users = [ userSettings.username ];

}
