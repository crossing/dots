# gcloud
PATH="$PATH:$HOME/.local/opt/google-cloud-sdk/bin"
typeset -U path
which gcloud > /dev/null || curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=$HOME/.local/opt/

GCLOUD_ZSH_COMPLETION=$HOME/.local/opt/google-cloud-sdk/completion.zsh.inc
[ -f $GCLOUD_ZSH_COMPLETION ] && source $GCLOUD_ZSH_COMPLETION
unset GCLOUD_ZSH_COMPLETION

_omz_plugin kubectl

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
