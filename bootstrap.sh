#!/usr/bin/env bash

set -euo pipefail

if [ ! -f /etc/profile.d/nix.sh ]; then
    echo "Nix is not installed. Bail out.";
    exit 1;
fi

source /etc/profile.d/nix.sh
if ! (nix-channel --list | grep nixpkgs > /dev/null); then
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
  nix-channel --update
fi

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix run nixpkgs#chezmoi -- init https://github.com/crossing/dots.git --apply
