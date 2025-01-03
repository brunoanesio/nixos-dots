{ pkgs, ... }:
{
  imports = [
    ./waybar.nix
    ./rofi
    ./wlogout
    ./swaync
  ];

  home.packages = with pkgs; [
    hyprlock
    hyprpicker
    waybar
    grimblast
    cliphist
    hyprpaper
    swaynotificationcenter
    xfce.mousepad
    kdePackages.polkit-kde-agent-1
  ];

  home.file.".config/hypr" = {
    source = ./config;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "~/backgrounds/063.png" ];
      wallpaper = [ "HDMI-A-1,~/backgrounds/063.png" ];
    };
  };
}
