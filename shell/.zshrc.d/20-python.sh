# Python
if [ ! -d $HOME/.pyenv ]; then
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -d $HOME/.pyenv/plugins/pyenv-virtualenv ]; then
    git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
fi

_omz_plugin pyenv
_omz_plugin python
_omz_plugin pip
_omz_plugin pipenv
_omz_plugin virtualenv

# Pipx
[ -f $HOME/.local/bin/pipx ] || python3 -m pip install --user pipx
eval "$(register-python-argcomplete pipx)"

# Poetry
if [ ! -d "$HOME/.poetry" ]; then
    sh -c "curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python"
    ln -s "$HOME/.poetry/bin/poetry" "$HOME/.local/bin"
    poetry completions zsh > $HOME/.zfunc/_poetry
fi

# Conda
source $HOME/.conda/etc/profile.d/conda.sh

antibody bundle bckim92/zsh-autoswitch-conda
