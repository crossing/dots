# aws
which aws > /dev/null 2>&1 || pipx install awscli
_omz_plugin aws

# aws-vault
AWS_VAULT_VERSION=5.4.4
if ! ( which aws-vault > /dev/null 2>&1 &&
       aws-vault --version | grep -w "v${AWS_VAULT_VERSION}" > /dev/null ); then
    curl -L https://github.com/99designs/aws-vault/releases/download/v${AWS_VAULT_VERSION}/aws-vault-linux-amd64 -o $HOME/.local/bin/aws-vault
    chmod +x $HOME/.local/bin/aws-vault
fi
antibody bundle blimmer/zsh-aws-vault