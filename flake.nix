{
  description = "Root flake for aarch64-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    cocoapods.url = "path:./cocoapods";
    cocoapods.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, cocoapods }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in
    {
      devShells.aarch64-darwin = {
        cocoapods = cocoapods.devShells.aarch64-darwin.default;
      };
    };
}
