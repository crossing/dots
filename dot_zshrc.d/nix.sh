if [ -f /etc/profile.d/nix.sh ]; then
    source /etc/profile.d/nix.sh
    _zgen_load chisui/zsh-nix-shell
    _zgen_load spwhitt/nix-zsh-completions
fi
