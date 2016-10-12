export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH:$GOPATH/bin

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer
