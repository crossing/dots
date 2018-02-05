if [ ! -d $HOME/.goenv ]; then
    git clone https://github.com/syndbg/goenv.git ~/.goenv
fi

export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
typeset -U path
eval "$(goenv init -)"
