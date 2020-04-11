source <(antibody init)
ANTIBODY_HOME="$(antibody home)"

autoload -Uz compinit 
compinit

ZSH="$ANTIBODY_HOME"/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
ZSH_CACHE_DIR="$ANTIBODY_HOME/zsh_cache"
mkdir -p $ZSH_CACHE_DIR

_omz_plugin() {
    local plugin=$1
    antibody bundle robbyrussell/oh-my-zsh path:plugins/$plugin
}

autoload -U bashcompinit
bashcompinit
for d in $HOME/.zshrc.d/*; do
    source $d
done

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-completions
antibody bundle robbyrussell/oh-my-zsh path:lib
antibody bundle robbyrussell/oh-my-zsh path:themes/robbyrussell.zsh-theme

compinit -i
typeset -U path
