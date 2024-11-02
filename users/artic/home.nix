{
  pkgs,
  ...
}:

{
  systemd.user.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1001/ssh-agent.socket";
  };

  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/hyprland
    ../../home/shell
    ../../home/rofi
    ../../home/wlogout
    # ../../home/nixvim
  ];
}
