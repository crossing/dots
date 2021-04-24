if [ -f /etc/profile.d/nix.sh ]; then
    source /etc/profile.d/nix.sh
    export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
    _zgen_load chisui/zsh-nix-shell
    _zgen_load spwhitt/nix-zsh-completions
    compinit
fi

if [ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh 
fi
