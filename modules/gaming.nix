{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    # package = pkgs.millennium;
  };
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
}
