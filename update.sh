#!/usr/bin/env bash
set -euo pipefail

nix flake update
sudo nixos-rebuild switch --flake '.#klopsmachine'
home-manager switch --flake '.#user'
git add *
git commit -m "update"
git push
