{
  description = "NixOS com Home Manager e Hyprland Unstable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    illogical-impulse = {
      # url = "github:bigsaltyfishes/end-4-dots";
      url = "github:sitolam/end-4-dots";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
   # hyprland = {
   #   url = "github:hyprwm/Hyprland";
   #   inputs.nixpkgs.follows = "nixpkgs";
   # };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
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
            extraSpecialArgs = { inherit inputs; };
            users.leo = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
      # specialArgs = { inherit inputs; };
    };
  };
}

