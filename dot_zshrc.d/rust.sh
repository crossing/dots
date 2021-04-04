export RUSTUP_HOME=$HOME/.rustup
path+=($HOME/.cargo/bin)

if ! (( $+commands[rustup] )); then
    curl \
        --proto '=https' \
        --tlsv1.2 \
        -sSf https://sh.rustup.rs |\
    bash -s -- -v -y --no-modify-path --default-toolchain none
fi

_zgen_omz rustup
_zgen_omz rust
_zgen_omz cargo
