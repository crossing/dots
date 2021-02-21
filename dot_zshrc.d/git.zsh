_omz_plugin git
_omz_plugin git-extras

function gh() {
    unfunction gh
    _asdf_tool github-cli 1.5.0
    gh completion --shell zsh > $HOME/.zfunc/_gh
    compinit

    gh $@
}
