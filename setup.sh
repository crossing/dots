#!/usr/bin/env bash

set -euo pipefail

mkdir -p $HOME/.local/bin
curl -sfL https://git.io/chezmoi | sh -s - -b $HOME/.local/bin

$HOME/.local/bin/chezmoi init https://github.com/crossing/dots.git --apply
