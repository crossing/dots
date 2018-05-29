if [ ! -d $HOME/.goenv ]; then
    git clone https://github.com/syndbg/goenv.git ~/.goenv
fi

export GOENV_ROOT=$HOME/.goenv
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$GOENV_ROOT/bin:$PATH
typeset -U path
eval "$(goenv init -)"
