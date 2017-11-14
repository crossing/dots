if [ ! -d /nix/store ]; then
    curl https://nixos.org/nix/install | sh
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer
