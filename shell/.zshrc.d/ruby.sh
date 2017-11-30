if [ ! -d $HOME/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
fi

if [ ! -d $HOME/.rbenv/plugins/ruby-build ]; then
    mkdir -p $HOME/.rbenv/plugins;
    git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build;
fi

plugins+=(ruby rbenv bundler)
