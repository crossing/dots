function kubectl() {
    unfunction kubectl
    _asdf_tool kubectl 1.18.2
    _omz_plugin kubectl
    kubectl $@
}

function minikube() {
    unfunction minikube
    _asdf_tool minikube 1.10.1
    _omz_plugin minikube
    minikube $@
}

function skaffold() {
    unfunction skaffold
    _asdf_tool skaffold 1.10.1
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
    _asdf_tool eksctl 0.20.0
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
