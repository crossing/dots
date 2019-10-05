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

# Pipsi
[ -f $HOME/.local/bin/pipsi ] || sh -c "curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python"

# Conda
source $HOME/.conda/etc/profile.d/conda.sh
conda activate

antibody bundle bckim92/zsh-autoswitch-conda
