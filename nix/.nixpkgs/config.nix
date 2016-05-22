{
  packageOverrides = pkgs: with pkgs; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        autojump
      ];
    };
  };
}
