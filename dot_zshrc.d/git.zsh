_omz_plugin git
_omz_plugin git-extras

_asdf_tool github-cli 1.6.1

function gh() {
    unfunction gh
    gh completion --shell zsh > $HOME/.zfunc/_gh
    compinit

    gh $@
}
