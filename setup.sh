#!/usr/bin/env bash

set -euo pipefail

mkdir -p $HOME/.local/bin
curl -sfL https://git.io/chezmoi | sh -s - -b $HOME/.local/bin

if [ ! -f /etc/profile.d/nix.sh ]; then
    echo "Nix is not installed. Bail out.";
    exit 1;
fi

source /etc/profile.d/nix.sh
if [ ! (nix-channel --list | grep nixos-20.09 > /dev/null) ]; then
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
  nix-channel --update
fi

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

$HOME/.local/bin/chezmoi init https://github.com/crossing/dots.git --apply
home-manager switch
