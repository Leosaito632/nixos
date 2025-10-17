{
  description = "NixOS com Home Manager e Hyprland Unstable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # illogical-impulse.url = "github:xBLACKICEx/end-4-dots-hyprland-nixos";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            users.leo = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}

