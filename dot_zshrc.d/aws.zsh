if ! (( $+commands[oidc] )); then
    pipx install https://github.com/crossing/oidc-cli/releases/download/v0.1.2/oidc-cli-0.1.2.tar.gz
fi
