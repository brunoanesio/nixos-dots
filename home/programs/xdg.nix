{ config, ... }:
let
  browser = [ "firefox.desktop" ];
  editor = [ "nvim.desktop" ];
  explorer = [ "thunar.desktop" ];

  # XDG MIME types
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = [ "chromium-browser.desktop" ];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;
    "x-scheme-handler/nxm" = [ "modorganizer2-nxm-handler.desktop" ];
    "x-scheme-handler/nxm-protocol" = [ "modorganizer2-nxm-handler.desktop" ];
    "inode/directory" = explorer;

    "audio/*" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.dekstop" ];
    "image/*" = [ "imv.desktop" ];
    "application/json" = editor;
    "application/pdf" = [ "org.pwmt.zathura.desktop.desktop" ];
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
  };
in
{
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
