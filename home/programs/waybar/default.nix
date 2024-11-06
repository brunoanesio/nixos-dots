{ ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        min-height: 0;
        min-width: 0;
        font-family: Lexend, "Font Awesome 6 Free Solid";
        font-size: 16px;
        font-weight: 600;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: 0.5s;
        /* background-color: #1e1e2e; */
        /* background-color: #181825; */
        background-color: #11111b;
        /* background-color: rgba(24, 24, 37, 0.6); */
      }

      #workspaces button {
        min-height: 0;
        min-width: 0;
        padding: 0.3em 0.6em;
        margin: 5px 4px;
        border-radius: 4px;
        /* background-color: #181825; */
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button.active {
        background-color: #1e1e2e;
        color: #89b4fa;
      }

      #workspaces button.urgent {
        background-color: #1e1e2e;
        color: #f38ba8;
      }

      #clock,
      #pulseaudio,
      #custom-logo,
      #custom-power,
      #custom-spotify,
      #cpu,
      #tray,
      #memory,
      #window {
        min-height: 0;
        min-width: 0;
        padding: 0.3em 0.6em;
        border-radius: 4px;
        margin: 5px 4px;
        /* background-color: #181825; */
        background-color: #1e1e2e;
      }

      #custom-sep {
        padding: 0px;
        color: #585b70;
      }

      #custom-spotify.playing {
        color: #a6e3a1;
      }

      #custom-spotify.liked {
        color: #cba6f7;
      }
      #custom-spotify.added {
        color: #f9e2af;
      }

      #custom-spotify.removed {
        color: #f38ba8;
      }

      #custom-spotify.paused {
        color: #9399b2;
      }

      window#waybar.empty #window {
        background-color: transparent;
      }

      #cpu {
        color: #94e2d5;
      }

      #memory {
        color: #cba6f7;
      }

      #clock {
        color: #74c7ec;
      }

      #clock.simpleclock {
        color: #89b4fa;
      }

      #window {
        color: #a6e3a1;
      }

      #pulseaudio {
        color: #b4befe;
      }

      #pulseaudio.muted {
        color: #a6adc8;
      }

      #custom-logo {
        color: #89b4fa;
      }

      #custom-power {
        color: #f38ba8;
        font-size: 14px;
      }

      tooltip {
        background-color: #181825;
        border: 2px solid #89b4fa;
      }
    '';
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        height = 40;
        spacing = 2;
        exclusive = true;
        gtk-layer-shell = true;
        passthrough = false;
        fixed-center = true;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ ];
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
          format = "  {:%H:%M}";
        };
        clock = {
          format = "  {:L%a %d %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          format = "  {usage}%";
          tooltip = true;
          interval = 1;
        };
        memory = {
          format = "  {used:0.1f}Gi";
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
            default = [
              " "
              " "
              " "
            ];
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
  };
}
