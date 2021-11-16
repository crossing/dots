{ config, pkgs, lib, ... }:
let sources = import ./nix/sources.nix;
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    initExtra = ''
      eval "$(register-python-argcomplete az)"
      eval "$(register-python-argcomplete gcloud)"
    '';

    initExtraBeforeCompInit = ''
      source $HOME/.zshrc.legacy
    '';

    envExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      export NIX_PATH=$HOME/.nix-defexpr/channels
      export EDITOR=emacs
    '';

    shellAliases = {
      j = "z";
      jj = "zz";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "git-extras"
        "docker"
        "ansible"
        "kubectl"
        "helm"
        "fasd"
        "python"
        "pip"
        "terraform"
        "vagrant"
        "emacs"
        "aws"
      ];
    };

    plugins = [
      {
        name = "zsh-aws-vault";
        src = sources.zsh-aws-vault;
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = sources.zsh-nix-shell;
      }
    ];
  };
}
