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
    p7zip
    htop
    fastfetch
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
    kdePackages.qtmultimedia
    libsForQt5.qt5.qtmultimedia
    libsForQt5.phonon
    distrobox
    podman
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
