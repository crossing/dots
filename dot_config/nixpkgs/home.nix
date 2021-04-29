{ config, pkgs, lib, ... }:
let sources = import ./nix/sources.nix;
in {
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  news.display = "silent";

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.packages = [
    # essential
    pkgs.chezmoi
    pkgs.zsh-completions
    pkgs.nerdfonts

    # utils
    pkgs.fasd
    pkgs._1password
    pkgs.nixfmt
    pkgs.tree
    pkgs.nix-tree

    # cloud
    pkgs.aws-vault
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.google-cloud-sdk

    # ops
    pkgs.ansible
    pkgs.vagrant
    pkgs.terraform_0_15
    pkgs.tflint

    # k8s
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.k9s
    pkgs.eksctl
    pkgs.skaffold
    pkgs.minikube

    # python
    pkgs.python39
    pkgs.poetry
    pkgs.python39Packages.argcomplete
    pkgs.python39Packages.pipx

    # java
    pkgs.jdk11

    pkgs.consul
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.gh.enable = true;
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
