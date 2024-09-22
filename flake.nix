{
  description = "Root flake for aarch64-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    cocoapods.url = "github:wojciech-kulik/nix-flakes/cocoapods";
    cocoapods.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, cocoapods }: {
      devShells.aarch64-darwin = {
        cocoapods = cocoapods.devShells.aarch64-darwin.default;
      };
    };
}
