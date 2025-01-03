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
        package = pkgs.kdePackages.sddm;
      };
    };
  };

  programs.hyprland = {
    enable = true;
  };

  catppuccin = {
    flavor = "mocha";
    accent = "blue";
    sddm = {
      enable = true;
      font = "Lexend";
      fontSize = "12";
    };
    grub.enable = true;
  };

  programs.ssh.startAgent = true;
  programs.xfconf.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  security.pam.services.hyprlock = { };
}
