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
_omz_plugin aws

if ! (( $+commands[oidc] )); then
    pipx install https://github.com/crossing/oidc-cli/releases/download/v0.1.2/oidc-cli-0.1.2.tar.gz
fi

# aws-vault
AWS_VAULT_VERSION=6.2.0
if ! ( which aws-vault > /dev/null 2>&1 &&
       aws-vault --version 2>&1 | grep -w "v${AWS_VAULT_VERSION}" > /dev/null ); then
    curl -L https://github.com/99designs/aws-vault/releases/download/v${AWS_VAULT_VERSION}/aws-vault-linux-amd64 -o $HOME/.local/bin/aws-vault
    chmod +x $HOME/.local/bin/aws-vault
fi
antibody bundle blimmer/zsh-aws-vault