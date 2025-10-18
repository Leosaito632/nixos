{
  description = "NixOS com Home Manager e Hyprland end-4-dots";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    illogical-impulse = {
      # url = "github:bigsaltyfishes/end-4-dots";
      # url = "github:sitolam/end-4-dots";
      url = "github:xBLACKICEx/end-4-dots-hyprland-nixos";

      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
   hyprland = {
     url = "github:hyprwm/Hyprland/v0.50.1-b";
     inputs.nixpkgs.follows = "nixpkgs";
   };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, ... }: {
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

