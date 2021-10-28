# emacs
if [ ! -d $HOME/.emacs.d ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

# snap
if (which snap 1>/dev/null 2>/dev/null); then
    path+=(/var/lib/snapd/bin /snap/bin)
fi
