if ! (( $+commands[ansible] )); then
    pipx install ansible
fi
_zgen_omz ansible
