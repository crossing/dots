{ config, pkgs, ... }:
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
        src = pkgs.fetchFromGitHub {
          owner = "blimmer";
          repo = "zsh-aws-vault";
          rev = "5f2f1a67e34661b7c9604d574ac0b3d554c124fe";
          sha256 = "1if81f6xl1h5hsqp68zl95lkk1gdypipck1pxz5v9fi5m6q7q8ng";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.1.0";
          sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
        };
      }
      {
        name = "nix-zsh-completion";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "spwhitt";
          repo = "nix-zsh-completions";
          rev = "0.4.4";
          sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
        };
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
