if [ ! -d "$HOME/.fnm" ]; then
    curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
fi

export PATH=$PATH:$HOME/.fnm
eval "$(fnm env --multi)"
typeset -U path
