if ! (( $+commands[ansible] )); then
    pipx install ansible
fi
_omz_plugin ansible