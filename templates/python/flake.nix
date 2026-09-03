{
  description = "Python";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Define the exact Python version you want to use
        pythonEnv = pkgs.python314.withPackages (
          ps: with ps; [

            # developer tools
            black # formatter
            pyright # type check

            # libraries
            # numpy
            # etc...
          ]
        );
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pythonEnv

            # Non-Python dependencies project might need
            # pkgs.openssl
          ];

          shellHook = ''
            exec $SHELL
          '';
        };
      }
    );
}
