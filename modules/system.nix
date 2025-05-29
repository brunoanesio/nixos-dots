{ pkgs, lib, ... }:
{

  imports = [
    ./services/nextdns.nix
  ];

  users.users = {
    frost = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "libvirtd"
      ];
    };
  };

  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "pt_BR.UTF-8/UTF-8"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  catppuccin = {
    flavor = "mocha";
    accent = "blue";
    sddm = {
      enable = true;
      font = "Lexend";
      fontSize = "12";
    };
    grub.enable = true;
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 7777 ];
      allowedUDPPorts = [ 7777 ];
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  services.xserver.videoDrivers = [ "amdgpu" ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
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
  # i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "ter-124b";
    keyMap = "br-abnt2";
    packages = with pkgs; [
      terminus_font
    ];
    useXkbConfig = false; # use xkb.options in tty.
  };

  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    libvirtd.enable = false;
    waydroid.enable = false;
    spiceUSBRedirection.enable = true;
  };

  fonts = {
    packages = with pkgs; [
      material-design-icons
      iosevka-comfy.comfy
      iosevka-comfy.comfy-fixed
      jetbrains-mono
      font-awesome
      lexend
      poppins
      noto-fonts-color-emoji
      iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
    fontDir.enable = true;
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
    virt-manager.enable = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
      pinentryPackage = pkgs.pinentry-gtk2;
      settings = {
        max-cache-ttl = 6048000;
        default-cache-ttl = 6048000;
      };
    };
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services = {
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    ollama = {
      enable = false;
      openFirewall = true;
    };
    open-webui = {
      enable = false;
      openFirewall = true;
      host = "192.168.194.192";
    };
    zerotierone = {
      enable = false;
    };
    archisteamfarm = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    gparted
    gnome-disk-utility
    dotnet-sdk_8
    wget
    curl
    git
    lm_sensors
    pciutils
    usbutils
    udiskie
    udisks
    gnupg
    which
    tree
  ];

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

  # services.myNextDNS = {
  #   enable = true;
  #   nextdnsId = "";
  # };
}
