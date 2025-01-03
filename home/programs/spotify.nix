{ pkgs, inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
      enabledSnippets = with spicePkgs.snippets; [
        removeGradient
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };

  home.packages = with pkgs; [
    pulseaudio
    mpv
    pavucontrol
    playerctl
  ];

  services.playerctld.enable = true;
}
