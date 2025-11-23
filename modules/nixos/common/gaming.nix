{ pkgs, ... }:
{
  programs.steam.enable = true;

  networking.firewall = {
    allowedTCPPorts = [
      7777
    ];
    allowedUDPPorts = [ 7777 ];
    allowedUDPPortRanges = [
      {
        from = 27000;
        to = 27050;
      }
    ];
  };
}
