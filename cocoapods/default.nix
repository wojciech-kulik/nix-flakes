{ pkgs, ... }:
let
  gemBundle = pkgs.bundlerEnv {
    name = "gems";
    gemdir = ./.;
  };
in
pkgs.mkShell {
  packages = with pkgs; [
    gemBundle
    (lib.hiPrio gemBundle.wrappedRuby)
  ];

  shellHook = '' 
    echo "Now you can use pods"
  '';
}
