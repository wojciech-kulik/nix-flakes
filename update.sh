#!/bin/bash

cd cocoapods
bundle update
nix-shell -p bundix --command "bundix -l"

cd ..
git add .
nix flake update
nix flake update --flake my

git add .
git commit -m "Update gems"
git push
