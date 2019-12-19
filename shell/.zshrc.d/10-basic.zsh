_omz_plugin git
_omz_plugin git-extras
_omz_plugin ansible

# Set .local/bin
mkdir -p $HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin
typeset -U path

# fasd
if ! (which fasd > /dev/null); then 
    curl -sSL https://raw.githubusercontent.com/clvv/fasd/master/fasd -o $HOME/.local/bin/fasd
    chmod +x $HOME/.local/bin/fasd
fi
_omz_plugin fasd
alias j=z
alias jj=zz

# emacs
if [ ! -d $HOME/.emacs.d ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
_omz_plugin emacs

# zfunc
mkdir -p $HOME/.zfunc
fpath+=$HOME/.zfunc

# direnv
DIRENV_VERSION=v2.20.0
if [ ! -f "$HOME/.local/bin/direnv" ]; then
    curl -sSL https://github.com/direnv/direnv/releases/download/${DIRENV_VERSION}/direnv.linux-amd64 -o "$HOME/.local/bin/direnv"
    chmod +x "$HOME/.local/bin/direnv"
fi
eval "$(direnv hook zsh)"

# snap
if (which snap 1>/dev/null 2>/dev/null); then
    export PATH=$PATH:/var/lib/snapd/snap/bin
    typeset -U path
fi
