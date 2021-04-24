{ config, pkgs, ... }:
let
  sources = import ./nix/sources.nix;
in
{
  home.username = "xing";
  home.homeDirectory = "/home/xing";
  home.packages = [
    pkgs._1password
    pkgs.aws-vault
    pkgs.awscli2
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.gh.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    initExtra = "source $HOME/.zshrc.legacy";

    zplug = {
      enable = true;
      plugins = [
        {
          name = "plugins/aws";
          tags = ["from:oh-my-zsh"];
        }
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
        src =  sources.zsh-nix-shell;
      }
      {
        name = "nix-zsh-completions";
        file = "init.zsh";
        src = sources.nix-zsh-completions;
      }
    ];
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
