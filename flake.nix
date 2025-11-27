{
  description = "NixOS com Home Manager e Hyprland copiado do github.com/vasujain275/rudra/";

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

    stylix.url = "github:danth/stylix";

    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      stylix,
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
          ./hosts/desktop/configuration.nix
          homeManagerCommon
          {
            home-manager.extraSpecialArgs.hostName = "desktop";
          }
        ];
      };
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = commonModules ++ [
          ./hosts/laptop/configuration.nix
          homeManagerCommon
          {
            home-manager.extraSpecialArgs.hostName = "laptop";
          }
        ];
      };
    };
}
