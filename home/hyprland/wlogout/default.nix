{ pkgs, ... }:
{
  programs.wlogout = {
    enable = true;
    style = ''
      * {
        background-image: none;
      }
      window {
        background-color: rgba(12, 12, 12, 0.6);
      }
      button {
        color: #ffffff;
        background-color: #1e1e2e;
        border-style: solid;
        border-width: 2px;
        border-radius: 8px;
        margin: 25px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
      }

      button:focus,
      button:active,
      button:hover {
        background-color: #313244;
        outline-style: none;
      }
      #lock {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }

      #logout {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }

      #suspend {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }
    '';
  };
}
