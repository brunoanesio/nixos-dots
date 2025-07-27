{
  pkgs,
  ...
}:
{
  imports = [
    ./mpv
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
    keepassxc
    lact
    chatterino7
    file-roller
    killall
    nix-tree
    lutris
    wineWowPackages.stable
    winetricks
    protontricks
    zenity
    baobab
    distrobox
    podman
    stremio
    qbittorrent-enhanced
    nix-prefetch-git
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    pulseaudio
    pavucontrol
    playerctl
    prismlauncher
    file
    fastfetch
    dconf-editor
    vesktop
    mousai
    resources
    krita
    nh
    radeontop
    amdgpu_top
    wl-clicker
    tree-sitter
    nodejs
    google-chrome
    vscodium
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        update_ms = 500;
      };
      extraConfig = ''
        show_boxes = "cpu mem proc"
        proc_filter_kernel = True
        presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default"
      '';
    };
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
        obs-vkcapture
        obs-pipewire-audio-capture
        input-overlay
      ];
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

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  xdg.configFile."MangoHud".source = ./mangohud;
  xdg.configFile."streamlink/config".source = ./streamlink/config;
}
