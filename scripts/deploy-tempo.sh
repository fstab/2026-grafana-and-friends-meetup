#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Deploying Tempo"
echo "############################################################"
echo

kubectl create configmap tempo-config --from-file=./deploy/tempo-config.yaml

kubectl apply -f ./deploy/tempo.yaml
