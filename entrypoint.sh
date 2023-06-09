#!/bin/bash

set -xe

echo "$KUBE_CONFIG" | base64 -d > /tmp/kube_config
export KUBECONFIG=/tmp/kube_config

sed -i "s/RELEASE_IMAGE/$RELEASE_IMAGE/g" apps/$APPLICATION/$ENVIRONMENT-values.yaml
helm install $APPLICATION apps/$APPLICATION/ -f apps/$APPLICATION/$ENVIRONMENT-values.yaml
