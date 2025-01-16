{
  pkgs,
  ...
}:
{
  imports = [
    ./dev.nix
    ./theme.nix
    ./spotify.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    zip
    unzip
    rar
    p7zip
    htop
    zoxide
    wl-clipboard
    libnotify
    xdg-utils
    xdg-user-dirs
    pinentry-gtk2
    keepassxc
    lact
    chatterino2
    file-roller
    killall
    nix-tree
    lutris
    heroic
    wineWowPackages.stable
    winetricks
    protontricks
    zenity
    baobab
    adwsteamgtk
    distrobox
    podman
    stremio
    qbittorrent-enhanced
    nix-prefetch
    nix-prefetch-git
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    streamlink
    pulseaudio
    mpv
    pavucontrol
    playerctl
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        update_ms = 500;
      };
      extraConfig = ''
        show_boxes = "proc cpu mem"
        proc_filter_kernel = True
        presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty"
      '';
    };
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            top = 1;
            bottom = 1;
          };
        };
        modules = [
          "break"
          {
            "type" = "os";
            "key" = "OS  ";
            "keyColor" = "31";
          }
          {
            "type" = "kernel";
            "key" = "KER ";
            "keyColor" = "32";
          }
          {
            "type" = "packages";
            "key" = "PKG ";
            "keyColor" = "33";
          }
          {
            "type" = "shell";
            "key" = "SH  ";
            "keyColor" = "34";
          }
          {
            "type" = "terminal";
            "key" = "TER ";
            "keyColor" = "35";
          }
          {
            "type" = "wm";
            "key" = "WM  ";
            "keyColor" = "36";
          }
          "break"
        ];
      };
    };
    mangohud.enable = true;
    eza.enable = true;
    bat.enable = true;
    fzf.enable = true;
    firefox.enable = true;
    fd.enable = true;
    ripgrep.enable = true;
    feh.enable = true;
    tealdeer.enable = true;
    cava.enable = true;
  };
  xdg.configFile."MangoHud".source = ./mangohud;
}
