# gcloud
CLOUDSDK_PREFIX=$HOME/.local/opt
export CLOUDSDK_HOME=$CLOUDSDK_PREFIX/google-cloud-sdk
export CLOUDSDK_PYTHON=python3

PATH="$PATH:$CLOUDSDK_HOME/bin"
typeset -U path
which gcloud > /dev/null || curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=$CLOUDSDK_PREFIX

_omz_plugin gcloud

# aws
which aws > /dev/null || pipx install awscli
_omz_plugin aws

# aws-vault
AWS_VAULT_VERSION=5.2.1
if ! ( which aws-vault > /dev/null 2>&1 &&
       aws-vault --version | grep -w "v${AWS_VAULT_VERSION}" > /dev/null ); then
    curl -L https://github.com/99designs/aws-vault/releases/download/v${AWS_VAULT_VERSION}/aws-vault-linux-amd64 -o $HOME/.local/bin/aws-vault
    chmod +x $HOME/.local/bin/aws-vault
fi
antibody bundle blimmer/zsh-aws-vault
