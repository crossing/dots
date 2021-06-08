{ config, pkgs, lib, ... }:
let sources = import ./nix/sources.nix;
in {
  imports = [ ./zsh.nix ];

  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  news.display = "silent";

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.language.base = "en_GB.UTF-8";
  home.sessionVariables = {
    LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };

  home.packages = [
    # nix
    pkgs.nixUnstable

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

    # dev
    pkgs.gh
    pkgs.glab

    # cloud
    pkgs.aws-vault
    pkgs.awscli2
    pkgs.ssm-session-manager-plugin
    pkgs.azure-cli
    pkgs.google-cloud-sdk

    # ops
    pkgs.ansible
    pkgs.vagrant
    pkgs.terraform_0_15
    pkgs.terragrunt
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

    # java
    pkgs.jdk11

    # misc
    pkgs.consul

    (import sources.oidc-cli { })
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;


  programs.starship = {
    enable = true;
    settings = lib.importTOML ./files/starship.toml;
  };

  services.lorri.enable = true;

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
