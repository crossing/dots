{ config, pkgs, lib, ... }:
{
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

  nixpkgs.overlays = (import ./overlays.nix);

  home.packages = [
    # nix goodies
    pkgs.nix
    pkgs.niv
    pkgs.nix-tree
    pkgs.nixpkgs-fmt
    pkgs.nixos-generators

    # essential
    pkgs.chezmoi
    pkgs.zsh-completions
    pkgs.nerdfonts

    # editors
    pkgs.emacs
    pkgs.vscode

    # utils
    pkgs.fasd
    pkgs.ripgrep
    pkgs.ranger
    pkgs._1password
    pkgs._1password-gui
    pkgs.tree

    # dev
    pkgs.gh

    # cloud
    pkgs.aws-vault
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.google-cloud-sdk

    # ops
    pkgs.ansible
    pkgs.vagrant
    pkgs.terraform
    pkgs.tflint

    # k8s
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.k9s
    pkgs.skaffold
    pkgs.minikube

    # python
    pkgs.python39
    pkgs.python39Packages.argcomplete

    # rust
    pkgs.rustup

    # misc
    pkgs.nodePackages.prettier
    pkgs.nodePackages.vscode-json-languageserver
  ];

  home.file = {
    "hm-update" = {
      source = ./files/hm-update;
      target = ".local/bin/hm-update";
      executable = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
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
  home.stateVersion = "21.11";
}
