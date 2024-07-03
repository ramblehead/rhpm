{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) stdenv;
      in {
        # nix build .#hello
        packages.hello = stdenv.mkDerivation {
          name = "Hello bash in nix";
          src = ./.;
          installPhase = ''
            echo "Hello, world!" > $out
          '';
        };

        # nix build
        defaultPackage = self.packages.${system}.hello;
      });
}
