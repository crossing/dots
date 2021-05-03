#!/usr/bin/env bash

set -euo pipefail

if [ ! -f /etc/profile.d/nix.sh ]; then
    echo "Nix is not installed. Bail out.";
    exit 1;
fi

source /etc/profile.d/nix.sh
if ! (nix-channel --list | grep home-manager > /dev/null); then
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --add https://nixos.org/channels/nixpkgs nixpkgs
  nix-channel --update
fi

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

nix run nixpkgs.chezmoi -c chezmoi init https://github.com/crossing/dots.git --apply
home-manager switch
