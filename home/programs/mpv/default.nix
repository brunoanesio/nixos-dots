{ pkgs, ... }:
let
  skipIntro = pkgs.fetchFromGitHub {
    owner = "rui-ddc";
    repo = "skip-intro";
    rev = "master";
    hash = "sha256-1rxwPiYIj4oxy8piRpiJeWU4b8vCnLCOvxt7uoru5xc=";
  };
in
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
      modernx
      thumbfast
      sponsorblock
    ];
    config = {
      osc = "no";
      border = "no";
    };
    # scriptOpts = {
    #   user_opts = {
    #     font = "Lexend";
    #   };
    #   thumbfast = {
    #     disabled = "false";
    #   };
    # };
  };
  home.file.".config/mpv/scripts/skip-intro.lua".source = "${skipIntro}/skip-intro.lua";
}
