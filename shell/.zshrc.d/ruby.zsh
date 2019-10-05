if [ ! -d $HOME/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
fi

if [ ! -d $HOME/.rbenv/plugins/ruby-build ]; then
    git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

_omz_plugin rbenv
_omz_plugin ruby
_omz_plugin bundler

