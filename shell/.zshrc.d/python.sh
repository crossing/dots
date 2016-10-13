if [ ! -d $HOME/.pyenv ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

plugins+=(pyenv python pip virtualenv)
