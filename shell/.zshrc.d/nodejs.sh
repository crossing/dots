if [ ! -d "$ZSH/custom/plugins/zsh-nvm" ]; then
    git clone https://github.com/lukechilds/zsh-nvm $ZSH/custom/plugins/zsh-nvm
fi

plugins+=(zsh-nvm)
