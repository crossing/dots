# pipx
if ! (( $+commands[pipx] )); then
    /usr/bin/python3 -m pip install --user pipx
fi
eval "$(register-python-argcomplete pipx)"

# poetry
if ! (( $+commands[poetry] )); then
    pipx install poetry
fi
poetry completions zsh > ~/.zfunc/_poetry

# Python
function python() {
    unfunction python
    _asdf_tool python 2.7.18
    _asdf_tool python 3.8.2
    asdf global python 3.8.2 2.7.18 # ensure python2 exists
    _omz_plugin python
    _omz_plugin pip

    python $@
}

export PYTHONWARNINGS=ignore
