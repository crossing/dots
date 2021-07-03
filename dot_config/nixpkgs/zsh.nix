{ config, pkgs, lib, ... }:
let sources = import ./nix/sources.nix;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    initExtra = ''
      autoload -U bashcompinit && bashcompinit
      eval "$(starship init zsh)"
      eval "$(register-python-argcomplete pipx)"
      eval "$(register-python-argcomplete az)"
      eval "$(register-python-argcomplete gcloud)"
    '';

    initExtraBeforeCompInit = ''
      source $HOME/.zshrc.legacy
    '';

    envExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels
    '';

    shellAliases = {
      j = "z";
      jj = "zz";
    };

    zplug = {
      enable = true;
      plugins = map (p: {
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
      {
        name = "zsh-syntax-highlighting";
        src = sources.zsh-syntax-highlighting;
      }
    ];
  };
}
