# Python
_omz_plugin python
_omz_plugin pip

# Conda
if [ -f $HOME/.conda/etc/profile.d/conda.sh ]; then
    source $HOME/.conda/etc/profile.d/conda.sh
    antibody bundle bckim92/zsh-autoswitch-conda
fi
