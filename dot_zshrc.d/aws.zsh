function update_aws() {
    TMPDIR=$(mktemp -d)
    pushd $TMPDIR
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install -i $HOME/.local/opt/aws-cli-v2 -b $HOME/.local/bin -u
    popd
}

# aws
if ! (( $+commands[aws] )); then
    update_aws
fi
_zgen_omz aws

if ! (( $+commands[oidc] )); then
    pipx install https://github.com/crossing/oidc-cli/releases/download/v0.1.2/oidc-cli-0.1.2.tar.gz
fi
