if [ ! -d $HOME/.pyenv ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -d $HOME/.pyenv/plugins/pyenv-virtualenv ]; then
  git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
fi

plugins+=(pyenv python pip virtualenv)