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
          name = hello-rh-tiny-v0;
          src = ./.;
          installPhase = ''
            cat << 'EOF' > $out
            #!/usr/bin/env bash

            set -eu
            set -o pipefail

            echo "Hello, world!"
            EOF

            chmod a+x $out
          '';
        };

        # nix build
        defaultPackage = self.packages.${system}.hello;
      });
}
