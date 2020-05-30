_asdf_tool kubectl 1.18.2
_asdf_tool minikube 1.10.1
_asdf_tool skaffold 1.10.1
_asdf_tool fluxctl 1.19.0
_asdf_tool eksctl 0.20.0
_asdf_tool helm 3.2.1

_omz_plugin kubectl
_omz_plugin minikube
_omz_plugin helm

source <(skaffold completion zsh)
source <(fluxctl completion zsh)

eksctl completion zsh > $HOME/.zfunc/_eksctl