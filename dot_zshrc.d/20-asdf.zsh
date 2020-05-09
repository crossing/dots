if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
    pushd $HOME/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    popd
fi

_omz_plugin asdf

_asdf_tool() {
    local plugin=$1
    local version=${2-latest}

    (asdf plugin list | grep $plugin 2>&1 > /dev/null) || asdf plugin add $plugin
    [[ "$version" == "latest" ]] && version=$(asdf latest $plugin)

    if ! (asdf list $plugin | grep $version 2>&1 > /dev/null); then
        asdf install $plugin $version
        asdf global $plugin $version
    fi
}

