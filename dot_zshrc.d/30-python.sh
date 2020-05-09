# Python
_asdf_tool python 3.8.2
_asdf_tool poetry
asdf install python 2.7.18
asdf global python 3.8.2 2.7.18 # ensure python2 exists

_omz_plugin python
_omz_plugin pip

# Pipx
[ -f $HOME/.local/bin/pipx ] || python3 -m pip install --user pipx argcomplete
eval "$(register-python-argcomplete pipx)"

export PYTHONWARNINGS=ignore
