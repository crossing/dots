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

# aws-vault
AWS_VAULT_VERSION=5.4.4
if ! ( which aws-vault > /dev/null 2>&1 &&
       aws-vault --version | grep -w "v${AWS_VAULT_VERSION}" > /dev/null ); then
    curl -L https://github.com/99designs/aws-vault/releases/download/v${AWS_VAULT_VERSION}/aws-vault-linux-amd64 -o $HOME/.local/bin/aws-vault
    chmod +x $HOME/.local/bin/aws-vault
fi
antibody bundle blimmer/zsh-aws-vault