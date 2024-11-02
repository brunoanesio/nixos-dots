{ pkgs, ... }:
{
  services = {
    xserver.desktopManager = {
      xterm.enable = false;
    };

    tumbler.enable = true;
    gvfs.enable = true;

    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        wayland.enable = true;
        enable = true;
      };
    };
  };

  programs.hyprland = {
    enable = true;
  };

  programs.ssh.startAgent = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  security.pam.services.hyprlock = { };
}
