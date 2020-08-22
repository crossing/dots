# gcloud
CLOUDSDK_PREFIX=$HOME/.local/opt
export CLOUDSDK_HOME=$CLOUDSDK_PREFIX/google-cloud-sdk
export CLOUDSDK_PYTHON=/usr/bin/python3

PATH="$PATH:$CLOUDSDK_HOME/bin"
which gcloud > /dev/null || curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=$CLOUDSDK_PREFIX

_omz_plugin gcloud
