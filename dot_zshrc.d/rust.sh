export RUSTUP_HOME=$HOME/.rustup
export PATH=$HOME/.cargo/bin:$PATH

if ! (( $+commands[rustup] )); then
    curl \
        --proto '=https' \
        --tlsv1.2 \
        -sSf https://sh.rustup.rs |\
    bash -s -- -v -y --no-modify-path --default-toolchain none
fi

_omz_plugin rustup
_omz_plugin rust
_omz_plugin cargo
