_zgen_omz git
_zgen_omz git-extras

_asdf_tool github-cli 1.8.1

function gh() {
    unfunction gh
    gh completion --shell zsh > $HOME/.zfunc/_gh
    compinit

    gh $@
}
