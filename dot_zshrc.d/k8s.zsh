_asdf_tool kubectl 1.18.2
_asdf_tool minikube 1.17.1
_asdf_tool skaffold 1.20.0
_asdf_tool fluxctl 1.19.0
_asdf_tool eksctl 0.34.0
_asdf_tool helm 3.2.1
_asdf_tool kustomize 3.8.0
_asdf_tool k9s 0.24.7

function skaffold() {
    unfunction skaffold
    source <(skaffold completion zsh)
    skaffold $@
}

function eksctl() {
    unfunction eksctl
    eksctl completion zsh > $HOME/.zfunc/_eksctl
    eksctl $@
}

function fluxctl() {
    unfunction fluxctl
    source <(fluxctl completion zsh)
    compinit
    fluxctl $@
}

function kustomize() {
    unfunction kustomize
    complete -C $(which kustomize) kustomize
    kustomize $@
}

function k9s() {
    unfunction k9s
    k9s $@
}

_omz_plugin kubectl
_omz_plugin helm