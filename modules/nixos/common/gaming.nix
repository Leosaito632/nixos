{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  programs.steam.enable = true;

  networking.firewall = {
    allowedTCPPorts = [
      7777
      21604
    ];
    allowedUDPPorts = [
      7777
      21604
    ];
  };

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
      fabric-server-test = {
        enable = true;

        whitelist = {
        };

        package = pkgs.fabricServers.fabric-26_2.override {
          jre_headless = pkgs.jdk25_headless;
        };

        serverProperties = {
          server-port = 21604;
          force-gamemode = true;
          difficulty = 3;
          gamemode = 0;
          max-players = 4;
          motd = "Servidor Fabric 26.2";
          white-list = true;
          view-distance = 32;
          simulation-distance = 16;
        };
      };
    };
  };

}
