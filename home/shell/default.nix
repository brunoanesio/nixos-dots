{ config, ... }:
let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in
{
  imports = [
    ./common.nix
    ./terminals.nix
    ./bash.nix
  ];

  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    # set default applications
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  home.shellAliases = {
    v = "nvim";
    exa = "eza --icons --group-directories-first";
    ex = "exa -a";
    exx = "exa -la";
    exg = "exa -la --git";
    rg = "rg -i";
    grep = "grep -i --color=auto";
    ls = "ls --color=auto";
    la = "ls -a";
    ll = "ls -lah";
    lg = "lazygit";
    nixups = "sudo nixos-rebuild switch --recreate-lock-file --flake .";
    "60hz" = "hyprctl keyword monitor HDMI-A-1,1920x1080@60,auto,1";
    "75hz" = "hyprctl keyword monitor HDMI-A-1,1920x1080@75,auto,1";
    nixup = "sudo nixos-rebuild test --recreate-lock-file --flake .";
  };
}
