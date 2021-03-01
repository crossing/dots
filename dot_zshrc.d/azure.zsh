if ! (( $+commands[az] )); then
    pipx install azure-cli
fi

source $(which az.completion.sh)
