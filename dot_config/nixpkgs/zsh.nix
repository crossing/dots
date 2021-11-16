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
      autoload -Uz bashcompinit && bashcompinit
      complete -C aws_completer aws

      eval "$(starship init zsh)"
      eval "$(register-python-argcomplete az)"
      eval "$(register-python-argcomplete gcloud)"

      bindkey "$terminfo[kcuu1]" history-substring-search-up
      bindkey "$terminfo[kcud1]" history-substring-search-down
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

    zplug = {
      enable = true;
      plugins = map
        (p: {
          name = "plugins/${p}";
          tags = [ "from:oh-my-zsh" ];
        }) [
        "git"
        "git-extra"
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
      {
        name = "zsh-history-substring-search";
        src = sources.zsh-history-substring-search;
      }
    ];
  };
}
