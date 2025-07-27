{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # services.lsfg-vk = {
  #   enable = true;
  #   ui.enable = true;
  # };
}
