{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pulseaudio
    mpv
    pavucontrol
    playerctl
  ];
  services.playerctld.enable = true;
}
