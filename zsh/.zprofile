export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH:$GOPATH/bin

if [ -e /home/xing/.nix-profile/etc/profile.d/nix.sh ]; then
  . /home/xing/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer
