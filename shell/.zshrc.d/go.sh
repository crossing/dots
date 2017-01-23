if [ ! -d $HOME/.gvm ]; then
  zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

. $HOME/.gvm/scripts/gvm
plugins+=(golang)
