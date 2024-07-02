{
  description = "ramblehead's Emacs flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self }: {
    foo = "bar";
  };
}
