#!/usr/bin/env zsh

# This is from https://github.com/mozilla-it/gcp-bastion-tunnel/?tab=readme-ov-file#installation
# but it doesn't work.
# export KUBECONFIG=~/.kube/config:~/mozilla/k8s/gcp-bastion-tunnel/kubeconfig
export KUBECONFIG=~/mozilla/k8s/gcp-bastion-tunnel/kubeconfig

# add gcloud-cli stuff
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
