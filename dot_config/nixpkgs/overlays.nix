let
  sources = import ./nix/sources.nix;
in
[
  (self: super: {
    awscli2 = super.awscli2.overridePythonAttrs (old: {
      postPatch = ''
        ${if old ? postPatch then old.postPatch else ""}

        substituteInPlace setup.py \
          --replace 's3transfer>=0.4.2,<0.5.0' 's3transfer'
      '';

      doCheck = false;
    });

    oidc-cli = (import sources.oidc-cli { });
  })
]
