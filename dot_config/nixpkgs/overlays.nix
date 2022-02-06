let
  sources = import ./nix/sources.nix;
in
[
  (self: super: {
    oidc-cli = (import sources.oidc-cli { });
    nixos-generators = import sources.nixos-generators;

    glab = super.glab.overrideAttrs (old: {
      postInstall = ''
        ${if (old ? postInstall ) then old.postInstall else ""}

        mkdir -p $out/share/zsh/site-functions
        $out/bin/glab completion -s zsh > $out/share/zsh/site-functions/_glab
      '';
    });

    sorri = (import sources.sorri { pkgs = self; });
  })
]
