{
  description = "NixOS com Home Manager e Hyprland end-4-dots";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, zen-browser, ... }:

	let
		system="x86_64-linux";
		commonModules=[
			./configuration.nix
			home-manager.nixosModules.home-manager
		];
		homeManagerCommon = {
			home-manager = {
				useUserPackages = true;
				useGlobalPkgs = true;
				users.leo = import ./home.nix;
				backupFileExtension = "backup";

				extraSpecialArgs = { inherit inputs;};
			};
		};
	in
	{
		nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
		  inherit system;
			modules = commonModules ++ [
				./hosts/desktop/hardware-configuration.nix
				homeManagerCommon
				{
					home-manager.extraSpecialArgs.hostName = "desktop";
				}
			];
		};
		nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
		  inherit system;
			modules = commonModules ++ [
				./hosts/laptop/hardware-configuration.nix
				homeManagerCommon
				{
					home-manager.extraSpecialArgs.hostName = "laptop";
				}
			];
		};
  };
}

