{ pkgs, inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
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
        ''
          * { font-family: "Lexend" !important }
        ''
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };

  services.playerctld.enable = true;
}
