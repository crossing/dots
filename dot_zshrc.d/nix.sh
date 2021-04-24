if [ -f /etc/profile.d/nix.sh ]; then
    source /etc/profile.d/nix.sh
    export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
fi
