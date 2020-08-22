function consul() {
    unfunction consul
    _asdf_tool consul 1.7.3
    consul $@
}

function terraform() {
    unfunction terraform
    _asdf_tool terraform 0.12.24
    _omz_plugin terraform
    compinit
    terraform $@
}

function tflint() {
    unfunction tflint
    _asdf_tool tflint 0.16.0
    tflint $@
}

