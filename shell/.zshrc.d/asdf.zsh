if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
    pushd $HOME/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    popd
fi

_omz_plugin asdf

adsf_plugins=(
    java
    clojure

    python
    poetry
    ruby
    rust
    golang
    nodejs

    haskell
    idris

    hub
    direnv
    terraform
    packer
)
for plugin in $adsf_plugins; do
    (asdf plugin list | grep $plugin > /dev/null) || asdf plugin add $plugin
done
