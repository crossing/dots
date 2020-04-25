# Python
_omz_plugin python
_omz_plugin pip

# Pipx
[ -f $HOME/.local/bin/pipx ] || python3 -m pip install --user pipx
eval "$(register-python-argcomplete pipx)"

# Conda
if [ -f $HOME/.conda/etc/profile.d/conda.sh ]; then
    source $HOME/.conda/etc/profile.d/conda.sh
    antibody bundle bckim92/zsh-autoswitch-conda
fi
