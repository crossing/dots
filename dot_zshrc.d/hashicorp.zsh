function consul() {
    unfunction consul
    _asdf_tool consul 1.9.3
    consul $@
}

function terraform() {
    unfunction terraform
    _asdf_tool terraform 0.14.6
    _omz_plugin terraform
    compinit
    terraform $@
}

function tflint() {
    unfunction tflint
    _asdf_tool tflint 0.24.1
    tflint $@
}

