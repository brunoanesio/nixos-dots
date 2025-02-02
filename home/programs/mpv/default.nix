{ pkgs, ... }:
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
  home.file.".config/mpv/scripts/skip-intro.lua".source = ./scripts/skip-intro.lua;
}
