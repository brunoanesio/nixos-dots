{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  catppuccin = {
    flavor = "mocha";
    accent = "blue";
    btop.enable = true;
    bat.enable = true;
    cava.enable = true;
    fzf.enable = true;
    gtk = {
      icon.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "Catppuccin-Mocha";
    };
  };

  gtk = {
    enable = true;
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    font = {
      name = "Lexend";
      size = 12;
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = "gtk-application-prefer-dark-theme 1";
    };
    gtk3 = {
      extraConfig = {
        gtk-theme-name = "adw-gtk3";
        gtk-font-name = "Lexend 12";
        gtk-application-prefer-dark-theme = 1;
        gtk-cursor-theme-name = "Adwaita";
      };
      extraCss = ''
        /* Catppuccin colors */
        @define-color blue #89b4fa;
        @define-color red #f38ba8;
        @define-color green #a6e3a1;
        @define-color text #cdd6f4;
        @define-color surface_0 #313244;
        @define-color base #1e1e2e;
        @define-color crust #11111b;

        /* Adwaita stuff */
        @define-color accent_color @blue;
        @define-color accent_bg_color @blue;
        @define-color accent_fg_color @crust;

        @define-color window_bg_color @base;
        @define-color window_fg_color @text;

        @define-color headerbar_bg_color @base;
        @define-color headerbar_fg_color @text;

        @define-color popover_bg_color @surface_0;
        @define-color popover_fg_color @text;

        @define-color dialog_bg_color @popover_bg_color;
        @define-color dialog_fg_color @popover_fg_color;

        @define-color sidebar_bg_color @base;
        @define-color sidebar_fg_color @text;
        @define-color sidebar_backdrop_color @base;
        @define-color sidebar_shade_color RGB(0 0 6 / 25%);
        @define-color sidebar_border_color RGB(0 0 6 / 36%);

        @define-color secondary_sidebar_bg_color @sidebar_backdrop_color;
        @define-color secondary_sidebar_fg_color @text;
        @define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
        @define-color secondary_sidebar_shade_color @sidebar_shade_color;
        @define-color secondary_sidebar_border_color @sidebar_border_color;

        @define-color view_bg_color @base;
        @define-color view_fg_color @text;

        @define-color card_bg_color @surface_0;
        @define-color card_fg_color @text;

        @define-color thumbnail_bg_color @surface_0;
        @define-color thumbnail_fg_color @text;

        @define-color warning_bg_color @red;
        @define-color warning_fg_color @text;
        @define-color warning_color @red;
        @define-color error_bg_color @red;
        @define-color error_fg_color @text;
        @define-color error_color @red;
        @define-color success_bg_color @green;
        @define-color success_fg_color @text;
        @define-color success_color @green;
        @define-color destructive_bg_color @red;
        @define-color destructive_fg_color @crust;
        @define-color destructive_color @red;

        :root {
          --accent-bg-color: @accent_bg_color;
          --accent-fg-color: @accent_fg_color;

          --destructive-bg-color: @destructive_bg_color;
          --destructive-fg-color: @destructive_fg_color;

          --success-bg-color: @success_bg_color;
          --success-fg-color: @success_fg_color;

          --warning-bg-color: @warning_bg_color;
          --warning-fg-color: @warning_fg_color;

          --error-bg-color: @error_bg_color;
          --error-fg-color: @error_fg_color;

          --window-bg-color: @window_bg_color;
          --window-fg-color: @window_fg_color;

          --view-bg-color: @view_bg_color;
          --view-fg-color: @view_fg_color;

          --headerbar-bg-color: @headerbar_bg_color;
          --headerbar-fg-color: @headerbar_fg_color;
          --headerbar-border-color: @headerbar_border_color;
          --headerbar-backdrop-color: @headerbar_backdrop_color;
          --headerbar-shade-color: @headerbar_shade_color;
          --headerbar-darker-shade-color: @headerbar_darker_shade_color;

          --sidebar-bg-color: @sidebar_bg_color;
          --sidebar-fg-color: @sidebar_fg_color;
          --sidebar-backdrop-color: @sidebar_backdrop_color;
          --sidebar-border-color: @sidebar_border_color;
          --sidebar-shade-color: @sidebar_shade_color;

          --secondary-sidebar-bg-color: @secondary_sidebar_bg_color;
          --secondary-sidebar-fg-color: @secondary_sidebar_fg_color;
          --secondary-sidebar-backdrop-color: @secondary_sidebar_backdrop_color;
          --secondary-sidebar-border-color: @secondary_sidebar_border_color;
          --secondary-sidebar-shade-color: @secondary_sidebar_shade_color;

          --card-bg-color: @card_bg_color;
          --card-fg-color: @card_fg_color;
          --card-shade-color: @card_shade_color;

          --dialog-bg-color: @dialog_bg_color;
          --dialog-fg-color: @dialog_fg_color;

          --popover-bg-color: @popover_bg_color;
          --popover-fg-color: @popover_fg_color;
          --popover-shade-color: @popover_shade_color;

          --thumbnail-bg-color: @thumbnail_bg_color;
          --thumbnail-fg-color: @thumbnail_fg_color;

          --shade-color: @shade_color;
          --scrollbar-outline-color: @scrollbar_outline_color;

          --thumbnail-bg-color: @thumbnail_bg_color;
          --thumbnail-fg-color: @thumbnail_fg_color;
        }
      '';
    };
    gtk4 = {
      extraConfig = {
        gtk-theme-name = "adw-gtk3";
        gtk-font-name = "Lexend 12";
        gtk-application-prefer-dark-theme = 1;
        gtk-cursor-theme-name = "Adwaita";
      };
      extraCss = ''
        /* Catppuccin colors */
        @define-color blue #89b4fa;
        @define-color red #f38ba8;
        @define-color green #a6e3a1;
        @define-color text #cdd6f4;
        @define-color surface_0 #313244;
        @define-color base #1e1e2e;
        @define-color crust #11111b;

        /* Adwaita stuff */
        @define-color accent_color @blue;
        @define-color accent_bg_color @blue;
        @define-color accent_fg_color @crust;

        @define-color window_bg_color @base;
        @define-color window_fg_color @text;

        @define-color headerbar_bg_color @base;
        @define-color headerbar_fg_color @text;

        @define-color popover_bg_color @surface_0;
        @define-color popover_fg_color @text;

        @define-color dialog_bg_color @popover_bg_color;
        @define-color dialog_fg_color @popover_fg_color;

        @define-color sidebar_bg_color @base;
        @define-color sidebar_fg_color @text;
        @define-color sidebar_backdrop_color @base;
        @define-color sidebar_shade_color RGB(0 0 6 / 25%);
        @define-color sidebar_border_color RGB(0 0 6 / 36%);

        @define-color secondary_sidebar_bg_color @sidebar_backdrop_color;
        @define-color secondary_sidebar_fg_color @text;
        @define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
        @define-color secondary_sidebar_shade_color @sidebar_shade_color;
        @define-color secondary_sidebar_border_color @sidebar_border_color;

        @define-color view_bg_color @base;
        @define-color view_fg_color @text;

        @define-color card_bg_color @surface_0;
        @define-color card_fg_color @text;

        @define-color thumbnail_bg_color @surface_0;
        @define-color thumbnail_fg_color @text;

        @define-color warning_bg_color @red;
        @define-color warning_fg_color @text;
        @define-color warning_color @red;
        @define-color error_bg_color @red;
        @define-color error_fg_color @text;
        @define-color error_color @red;
        @define-color success_bg_color @green;
        @define-color success_fg_color @text;
        @define-color success_color @green;
        @define-color destructive_bg_color @red;
        @define-color destructive_fg_color @crust;
        @define-color destructive_color @red;

        :root {
          --accent-bg-color: @accent_bg_color;
          --accent-fg-color: @accent_fg_color;

          --destructive-bg-color: @destructive_bg_color;
          --destructive-fg-color: @destructive_fg_color;

          --success-bg-color: @success_bg_color;
          --success-fg-color: @success_fg_color;

          --warning-bg-color: @warning_bg_color;
          --warning-fg-color: @warning_fg_color;

          --error-bg-color: @error_bg_color;
          --error-fg-color: @error_fg_color;

          --window-bg-color: @window_bg_color;
          --window-fg-color: @window_fg_color;

          --view-bg-color: @view_bg_color;
          --view-fg-color: @view_fg_color;

          --headerbar-bg-color: @headerbar_bg_color;
          --headerbar-fg-color: @headerbar_fg_color;
          --headerbar-border-color: @headerbar_border_color;
          --headerbar-backdrop-color: @headerbar_backdrop_color;
          --headerbar-shade-color: @headerbar_shade_color;
          --headerbar-darker-shade-color: @headerbar_darker_shade_color;

          --sidebar-bg-color: @sidebar_bg_color;
          --sidebar-fg-color: @sidebar_fg_color;
          --sidebar-backdrop-color: @sidebar_backdrop_color;
          --sidebar-border-color: @sidebar_border_color;
          --sidebar-shade-color: @sidebar_shade_color;

          --secondary-sidebar-bg-color: @secondary_sidebar_bg_color;
          --secondary-sidebar-fg-color: @secondary_sidebar_fg_color;
          --secondary-sidebar-backdrop-color: @secondary_sidebar_backdrop_color;
          --secondary-sidebar-border-color: @secondary_sidebar_border_color;
          --secondary-sidebar-shade-color: @secondary_sidebar_shade_color;

          --card-bg-color: @card_bg_color;
          --card-fg-color: @card_fg_color;
          --card-shade-color: @card_shade_color;

          --dialog-bg-color: @dialog_bg_color;
          --dialog-fg-color: @dialog_fg_color;

          --popover-bg-color: @popover_bg_color;
          --popover-fg-color: @popover_fg_color;
          --popover-shade-color: @popover_shade_color;

          --thumbnail-bg-color: @thumbnail_bg_color;
          --thumbnail-fg-color: @thumbnail_fg_color;

          --shade-color: @shade_color;
          --scrollbar-outline-color: @scrollbar_outline_color;

          --thumbnail-bg-color: @thumbnail_bg_color;
          --thumbnail-fg-color: @thumbnail_fg_color;
        }
      '';
    };
  };
}
