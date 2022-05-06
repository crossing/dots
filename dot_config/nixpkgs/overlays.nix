let
  sources = import ./nix/sources.nix;
in
[
  (self: super: {
    nixos-generators = import sources.nixos-generators;
  })
]
