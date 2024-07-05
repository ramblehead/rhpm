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
        name = "hello-rh-tiny-v0";
      in {
        # nix build .#hello
        packages.hello = stdenv.mkDerivation {
          inherit name;
          src = ./.;
          installPhase = ''
            SDPATH="$out/bin/${name}"
            mkdir -vp $out/bin

            cat << 'EOF' > $SDPATH
            #!/usr/bin/env bash

            set -eu
            set -o pipefail

            echo "Hello, world in bash!"
            EOF

            chmod a+x $SDPATH
          '';
        };

        # nix build
        defaultPackage = self.packages.${system}.hello;
      });
}
