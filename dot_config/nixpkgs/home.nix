{ config, pkgs, lib, ... }:
let sources = import ./nix/sources.nix;
in {
  home.username = "xing";
  home.homeDirectory = "/home/xing";
  home.packages = [
    # utils
    pkgs.fasd
    pkgs._1password
    pkgs.nixfmt

    # cloud
    pkgs.aws-vault
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.google-cloud-sdk

    # ops
    pkgs.ansible

    # k8s
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.k9s
    pkgs.eksctl
    pkgs.skaffold
    pkgs.minikube

    # python
    pkgs.python3
    pkgs.poetry
    pkgs.python39Packages.argcomplete
    pkgs.python39Packages.pipx
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.gh.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    initExtra = ''
      source $HOME/.zshrc.legacy
      eval "$(starship init zsh)"
      autoload -U bashcompinit && bashcompinit

      eval "$(register-python-argcomplete pipx)"
      eval "$(register-python-argcomplete az)"
      eval "$(register-python-argcomplete gcloud)"
    '';

    envExtra = ''
      source /etc/profile.d/nix.sh
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
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
      }) [ "git" "git-extra" "docker" "ansible" "kubectl" "helm" "fasd" ];
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
        name = "nix-zsh-completions";
        file = "init.zsh";
        src = sources.nix-zsh-completions;
      }
    ];
  };
  programs.starship = {
    enable = true;
    settings = lib.importTOML ./files/starship.toml;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
