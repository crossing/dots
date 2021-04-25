_zgen_load zsh-users/zsh-syntax-highlighting
_zgen_load zsh-users/zsh-completions
_zgen_omz robbyrussell.zsh-theme themes

# editor
export EDITOR='code --wait'

# fasd
if ! (which fasd > /dev/null); then
    curl -sSL https://raw.githubusercontent.com/clvv/fasd/master/fasd -o $HOME/.local/bin/fasd
    chmod +x $HOME/.local/bin/fasd
fi
_zgen_omz fasd
alias j=z
alias jj=zz

# emacs
if [ ! -d $HOME/.emacs.d ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
_zgen_omz emacs

# zfunc
mkdir -p $HOME/.zfunc
fpath+=$HOME/.zfunc

# snap
if (which snap 1>/dev/null 2>/dev/null); then
    path+=(/var/lib/snapd/bin /snap/bin)
fi
