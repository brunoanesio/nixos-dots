{ pkgs, ... }:
{
  services = {
    xserver.desktopManager = {
      xterm.enable = false;
    };

    gvfs.enable = true;
    udisks2.enable = true;

    displayManager = {
      sddm = {
        wayland.enable = true;
        enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };
    desktopManager.plasma6.enable = true;
  };

  programs.ssh.startAgent = true;
  programs.xfconf.enable = true;
}
