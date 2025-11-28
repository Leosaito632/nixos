{
  description = "NixOS com Home Manager e Noctalia https://docs.noctalia.dev/";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      ...
    }:

    let
      system = "x86_64-linux";
      commonModules = [
        home-manager.nixosModules.home-manager
      ];
      homeManagerCommon = {
        home-manager = {
          useUserPackages = true;
          useGlobalPkgs = true;
          users.leo = import ./home.nix;
          backupFileExtension = "backup";

          extraSpecialArgs = { inherit inputs; };
        };
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
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
