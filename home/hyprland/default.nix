{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprlock
    hyprpicker
    rofi-wayland
    waybar
    grimblast
    cliphist
    xfce.mousepad
    kdePackages.polkit-kde-agent-1
  ];

  home.file.".config/hypr" = {
    source = ./config;
    recursive = true;
  };

  services.gnome-keyring.enable = true;

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "~/backgrounds/063.png" ];
      wallpaper = [ "HDMI-A-1,~/backgrounds/063.png" ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  services.swaync = {
    enable = true;
    style = ./swaync.css;
  };
}
