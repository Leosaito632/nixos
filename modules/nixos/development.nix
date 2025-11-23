{ pkgs, ... }:
{
  virtualisation.docker.enable = true;
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  programs.nix-ld.enable = true;
  networking.firewall.allowedTCPPorts = [ 3306 ];
}
