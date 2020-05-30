_omz_plugin ansible

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-completions
antibody bundle robbyrussell/oh-my-zsh path:lib
antibody bundle robbyrussell/oh-my-zsh path:themes/robbyrussell.zsh-theme

# editor
export EDITOR='code --wait'

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

# snap
if (which snap 1>/dev/null 2>/dev/null); then
    export PATH=$PATH:/var/lib/snapd/snap/bin:/snap/bin
fi

# starship
if ! (( $+commands[starship] )); then
    curl -fsSL https://starship.rs/install.sh | bash -s - -b $HOME/.local/bin -f
fi
eval "$(starship init zsh)"
