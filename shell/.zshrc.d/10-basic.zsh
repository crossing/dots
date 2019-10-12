_omz_plugin git
_omz_plugin git-extras
_omz_plugin ansible
_omz_plugin fasd
alias j=z
alias jj=zz

# emacs
if [ ! -d $HOME/.emacs.d ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
_omz_plugin emacs

# Set .local/bin
export PATH=$PATH:$HOME/.local/bin
typeset -U path

# zfunc
mkdir -p $HOME/.zfunc
fpath+=$HOME/.zfunc

# direnv
DIRENV_VERSION=v2.20.0
if [ ! -f "$HOME/.local/bin/direnv" ]; then
    curl -l https://github.com/direnv/direnv/releases/download/${DIRENV_VERSION}/direnv.linux-amd64 -o "$HOME/.local/bin/direnv"
    chmod +x "$HOME/.local/bin/direnv"
fi
eval "$(direnv hook zsh)"
