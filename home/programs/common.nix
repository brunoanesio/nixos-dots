{
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    zip
    unzip
    p7zip
    htop
    fastfetch
    zoxide
    wl-clipboard
    xz
    jq
    zstd
    glow
    libnotify
    xdg-utils
    xdg-user-dirs
    pinentry-gtk2
    nix-output-monitor
    keepassxc
    lact
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "catppuccin-mocha";
      };
      themes = {
        catppuccin-mocha = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "d2bbee4f7e7d5bac63c054e4d8eca57954b31471";
            sha1 = "sha1-Pv4YVbFCULpXHci2GsOlzJwBwhw=";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
      };
    };
    firefox.enable = true;
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
    btop.enable = true;
    eza.enable = true;
    fzf.enable = true;
    fd.enable = true;
    ripgrep.enable = true;
    feh.enable = true;
    tealdeer.enable = true;
  };
}
