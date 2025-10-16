{
  description = "NixOS com Home Manager e Hyprland Unstable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
#    illogical-impulse.url = "github:xBLACKICEx/end-4-dots-hyprland-nixos";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.leo = import ./home.nix;
        }
      ];
    };
  };
}

