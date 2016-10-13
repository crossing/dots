if [ ! -d $HOME/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
fi

plugins+=(rbenv bundler)
BUNDLED_COMMANDS=(rubocop rerun)
