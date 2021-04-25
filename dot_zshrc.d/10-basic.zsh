# editor
export EDITOR='code --wait'

# emacs
if [ ! -d $HOME/.emacs.d ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
_zgen_omz emacs

# snap
if (which snap 1>/dev/null 2>/dev/null); then
    path+=(/var/lib/snapd/bin /snap/bin)
fi
