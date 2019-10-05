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
