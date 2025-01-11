{ pkgs, lib, ... }:
{

  imports = [
    ./services/nextdns.nix
  ];

  users.users = {
    frost = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  powerManagement.cpuFreqGovernor = "performance";

  services.xserver.videoDrivers = [ "amdgpu" ];

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

  virtualisation.containers.enable = true;
  virtualisation.podman.enable = true;

  fonts = {
    packages = with pkgs; [
      material-design-icons
      iosevka-comfy.comfy
      iosevka-comfy.comfy-fixed
      nerdfonts
      jetbrains-mono
      font-awesome
      lexend
      poppins
      noto-fonts-color-emoji
      iosevka
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
