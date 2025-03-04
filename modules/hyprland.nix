{ pkgs, ... }:
{
  services = {
    xserver.desktopManager = {
      xterm.enable = false;
    };

    tumbler.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        wayland.enable = true;
        enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };
  };

  programs.hyprland = {
    enable = true;
  };

  environment.variables.QT_QPA_PLATFORMTHEME = "kvantum";

  programs.ssh.startAgent = true;
  programs.xfconf.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  security.pam.services.hyprlock = { };
}
