# gcloud
PATH="$PATH:$HOME/.local/opt/google-cloud-sdk/bin"
typeset -U path
which gcloud > /dev/null || curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=$HOME/.local/opt/

GCLOUD_ZSH_COMPLETION=$HOME/.local/opt/google-cloud-sdk/completion.zsh.inc
[ -f $GCLOUD_ZSH_COMPLETION ] && source $GCLOUD_ZSH_COMPLETION
unset GCLOUD_ZSH_COMPLETION

_omz_plugin kubectl

# aws
which aws > /dev/null || pipsi install awscli
_omz_plugin aws

# aws-vault
antibody bundle blimmer/zsh-aws-vault

# terraform
TERRAFORM_VERSION=0.12.9
if ! ( which terraform > /dev/null &&
       terraform version | grep -w "Terraform v${TERRAFORM_VERSION}" > /dev/null ); then
    TEMP_DIR=$(mktemp -d)
    curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o ${TEMP_DIR}/terraform.zip
    pushd $TEMP_DIR
    unzip terraform.zip
    mv terraform $HOME/.local/bin/terraform
    chmod +x $HOME/.local/bin/terraform
    popd

    rm -rf $TEMP_DIR
fi

TERRAGRUNT_VERSION=0.19.29
if ! ( which terragrunt > /dev/null &&
       terragrunt --version | grep -w "terragrunt version v${TERRAGRUNT_VERSION}" > /dev/null ); then
    curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -o $HOME/.local/bin/terragrunt
    chmod +x $HOME/.local/bin/terragrunt
fi

