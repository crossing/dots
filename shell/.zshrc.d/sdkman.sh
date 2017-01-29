if [ ! -d $HOME/.sdkman ]; then
  curl -s "https://get.sdkman.io" | bash
  git clone https://github.com/nobeans/zsh-sdkman.git $ZSH/custom/plugins/sdkman
fi

plugins+=(sdkman)

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
