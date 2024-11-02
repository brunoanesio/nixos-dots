{ pkgs, ... }:
{

  home.file.".config/wlogout/icons" = {
    source = ./config/icons;
  };

  programs.wlogout = {
    enable = true;
    style = ./config/style.css;
  };
}
