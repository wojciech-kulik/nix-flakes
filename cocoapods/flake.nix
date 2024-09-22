{
  description = "Flake with CocoaPods + Keys";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      gemBundle = pkgs.bundlerEnv {
        name = "gems";
        gemdir = ./.;
      };
    in
    {
      devShells.aarch64-darwin.default = pkgs.mkShell {
        packages = with pkgs; [
          gemBundle
          (lib.hiPrio gemBundle.wrappedRuby)
        ];

        shellHook = '' 
          echo "Now you can use pods"
        '';
      };
    };
}
