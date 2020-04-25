if [ -f /etc/profile.d/nix.sh ]; then
    source /etc/profile.d/nix.sh
    antibody bundle chisui/zsh-nix-shell
    antibody bundle spwhitt/nix-zsh-completions
fi
