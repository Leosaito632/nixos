{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;

    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit"; # Comando seguro para Hyprland
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style =
      let
        # Pega as cores do Stylix
        colors = config.lib.stylix.colors;
      in
      ''
        * {
          font-family: "JetBrainsMono Nerd Font Mono", FontAwesome, sans-serif;
          background-image: none;
          transition: 20ms;
        }
        window {
          background-color: rgba(12, 12, 12, 0.1);
        }
        button {
          color: #${colors.base05};
          font-size: 20px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border-style: solid;
          background-color: rgba(12, 12, 12, 0.3);
          border: 3px solid #FFFFFF;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        button:focus,
        button:active,
        button:hover {
          color: #${colors.base0B};
          background-color: rgba(12, 12, 12, 0.5);
          border: 3px solid #FFFFFF;
        }

        /* Aponta para os ícones que vamos linkar manualmente */
        #logout {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/logout.png"));
        }
        #suspend {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/suspend.png"));
        }
        #shutdown {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/shutdown.png"));
        }
        #reboot {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/reboot.png"));
        }
        #lock {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/lock.png"));
        }
        #hibernate {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/hibernate.png"));
        }
      '';
  };
}
