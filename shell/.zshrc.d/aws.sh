. $HOME/.zshrc.d/go.sh

go get github.com/99designs/aws-vault
export AWS_VAULT_BACKEND=secret-service

plugins+=(aws)
