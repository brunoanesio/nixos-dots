{ pkgs, lib, ... }:
{
  users.users = {
    artic = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
    frost = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        firefox
        neovim
        kitty
        keepassxc
        lazygit
      ];
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nix.optimise.automatic = true;

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "ter-124b";
    keyMap = "br-abnt2";
    packages = with pkgs; [
      terminus_font
    ];
    useXkbConfig = false; # use xkb.options in tty.
  };

  fonts = {
    packages = with pkgs; [
      material-design-icons
      iosevka
      nerdfonts
      jetbrains-mono
      font-awesome
      lexend
      poppins
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Lexend"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Lexend"
          "Noto Color Emoji"
        ];
        monospace = [
          "JetBrains Mono NF"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
    };
  };

  security.polkit.enable = true;

  services = {
    openssh.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    lm_sensors
    pciutils
    usbutils
    gnupg
    which
    tree
  ];

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };
}
