plugins+=(nix-zsh-completions)

nix-env -i all
alias nz="nix-shell --run zsh"
