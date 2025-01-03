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
    protontricks
    zenity
    baobab
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        update_ms = 500;
        show_boxes = "proc cpu mem";
      };
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
