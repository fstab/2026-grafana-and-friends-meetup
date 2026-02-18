#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Deploying Beyla"
echo "############################################################"
echo

kubectl create configmap beyla-config --from-file=./deploy/beyla-config.yaml
kubectl apply -f ./deploy/beyla.yaml
