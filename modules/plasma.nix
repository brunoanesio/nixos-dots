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
      };
    };
    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "blue" ];
    })
  ];

  programs.ssh.startAgent = true;
  programs.xfconf.enable = true;
}
