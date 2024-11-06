{ pkgs ... } =
{
  programs.waybar = {
    enable = true;
    style = {
      src = pkgs.fetchFromGitHub {
        owner = "brunoanesio";
        repo = "waybar-config";
        rev = "262871ec58c90d1e598dee52d44c26f21b3f749c";
        sha256 = "sha1-Pv4YVbFCULpXHci2GsOlzJwBwhw=";
      };
      file = "style.css";
    };
    settings = {
      layer = "bottom";
      position = "top";
      height = 40;
      spacing = 2;
      exclusive = true;
      gtk-layer-shell = true;
      passthrough = false;
      fixed-center = true;
      modules-left = ["hyprland/workspaces" "hyprland/window"];
      modules-center = [];
      modules-right = [
      "cpu"
      "memory"
      "pulseaudio"
      "clock"
      "clock#simpleclock"
      "tray"
      "custom/power"
      ];
      "custom/spotify" = {
        format = "  {}";
        return-type = "json";
        on-click = "playerctl -p spotify play-pause";
        on-click-right = "spotifatius toggle-liked";
        on-click-middle = "playerctl -p spotify next";
        exec = "spotifatius monitor";
      };
      "hyprland/workspaces" = {
        on-click = "activate";
        format = "{id}";
        all-outputs = true;
        disable-scroll = false;
        active-only = false;
      };
      "hyprland/window" = {
        format = "{class}";
      };
      tray = {
        show-passive-items = true;
        spacing = 10;
      };
      "clock#simpleclock" = {
        tooltip = false;
        format = "  { =%H =%M}";
      };
      clock = {
        format = "  { =L%a %d %b}";
        tooltip-format = "<big>{ =%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
      cpu = {
        format = "  {usage}%";
        tooltip = true;
        interval = 1;
      };
      memory = {
        format = "  {used =0.1f}Gi";
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "  muted";
        format-icons = {
          headphone = " ";
          hands-free = "󰂑";
          headset = "󰂑";
          phone = "";
          portable = "";
          car = "";
          default = [" " " " " "];
        };
        on-click = "pavucontrol";
      };
      "custom/sep" = {
        format = "|";
        tooltip = false;
      };
      "custom/power" = {
        tooltip = false;
        on-click = "wlogout -p layer-shell &";
        format = "⏻";
      };
    };
  };
}
