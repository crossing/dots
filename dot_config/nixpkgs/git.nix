{ config, pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.git.override {
      withLibsecret = true;
    };
  };

  programs.gh.enable = true;
}
