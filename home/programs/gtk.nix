{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    font = {
      name = "Lexend";
      size = 12;
    };
    gtk3 = {
      extraConfig = {
        gtk-theme-name = "adw-gtk3";
        gtk-font-name = "Lexend 12";
        gtk-application-prefer-dark-theme = 1;
        gtk-cursor-theme-name = "Adwaita";
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-theme-name = "adw-gtk3";
        gtk-font-name = "Lexend 12";
        gtk-application-prefer-dark-theme = 1;
        gtk-cursor-theme-name = "Adwaita";
      };
      extraCss = ''
        headerbar.default-decoration {
          margin-bottom: 50px;
          margin-top: -100px;
        }

        window.csd,
        window.csd decoration {
          box-shadow: none;
        }

        @define-color window_bg_color #181825;
        @define-color window_fg_color #cdd6f4;
        @define-color view_bg_color #1e1e2e;
        @define-color view_fg_color @window_fg_color;
        @define-color accent_bg_color #89b4fa;
        @define-color accent_color @accent_bg_color;
        @define-color headerbar_bg_color @window_bg_color;
        @define-color headerbar_fg_color @window_fg_color;
        @define-color card_bg_color rgba(255, 255, 255, 0.08);
        @define-color card_fg_color @window_fg_color;
        @define-color popover_bg_color #1e1e2e;
        @define-color popover_fg_color @view_fg_color;
        @define-color dialog_bg_color @popover_bg_color;
        @define-color dialog_fg_color @popover_fg_color;
        @define-color sidebar_bg_color @headerbar_bg_color;
        @define-color sidebar_fg_color @window_fg_color;
        @define-color sidebar_backdrop_color @window_bg_color;
        @define-color sidebar_shade_color rgba(0, 0, 0, 0.25);
      '';
    };
  };
}
