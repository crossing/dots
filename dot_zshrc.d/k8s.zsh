function kubectl() {
    unfunction kubectl
    _asdf_tool kubectl 1.18.2
    kubectl $@
}

function minikube() {
    unfunction minikube
    _asdf_tool minikube 1.17.1
    minikube $@
}

function skaffold() {
    unfunction skaffold
    _asdf_tool skaffold 1.20.0
    source <(skaffold completion zsh)
    skaffold $@
}

function fluxctl() {
    unfunction fluxctl
    _asdf_tool fluxctl 1.19.0
    source <(fluxctl completion zsh)
    fluxctl $@
}

function eksctl() {
    unfunction eksctl
    _asdf_tool eksctl 0.34.0
    eksctl completion zsh > $HOME/.zfunc/_eksctl
    compinit
    eksctl $@
}

function helm() {
    unfunction helm
    _asdf_tool helm 3.2.1
    _omz_plugin helm
    helm $@
}

function kustomize() {
    unfunction kustomize
    _asdf_tool kustomize 3.8.0
    complete -C $(which kustomize) kustomize
    kustomize $@
}

function k9s() {
    unfunction k9s
    _asdf_tool k9s
    k9s $@
}

_omz_plugin kubectl
