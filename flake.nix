{
  description = "NixOS com Home Manager e Noctalia https://docs.noctalia.dev/";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-minecraft,
      ...
    }:

    let
      system = "x86_64-linux";
      userSettings = import ./variables.nix;
      commonModules = [
        home-manager.nixosModules.home-manager
      ];
      homeManagerCommon = {
        home-manager = {
          useUserPackages = true;
          useGlobalPkgs = true;
          users.leo = import ./home.nix;
          backupFileExtension = "bkp";

          extraSpecialArgs = {
            inherit inputs;
            vars = userSettings;
          };
        };
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        inherit system;
        modules = commonModules ++ [

          homeManagerCommon
          ./hosts/desktop/configuration.nix
          {
            home-manager.extraSpecialArgs.hostName = "desktop";
          }
        ];
      };
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = commonModules ++ [
          homeManagerCommon
          ./hosts/laptop/configuration.nix
          {
            home-manager.extraSpecialArgs.hostName = "laptop";
          }
        ];
      };
    };
}
