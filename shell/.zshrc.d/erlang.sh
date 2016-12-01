if [ ! -d $HOME/.evm ]; then
  git clone https://github.com/robisonsantos/evm.git $HOME/.evm
  pushd $HOME/.evm
  ./install
  popd
fi

. $HOME/.evm/scripts/evm
plugins+=(rebar)
