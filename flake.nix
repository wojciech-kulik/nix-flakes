{
  description = "Root flake for aarch64-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    cocoapods.url = "github:wojciech-kulik/nix-flakes?dir=cocoapods";
    cocoapods.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { cocoapods, ... }: {
      devShells.aarch64-darwin = {
        cocoapods = cocoapods.devShells.aarch64-darwin.default;
      };
    };
}
