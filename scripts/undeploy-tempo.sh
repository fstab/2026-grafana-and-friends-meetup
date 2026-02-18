#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Un-Deploying Tempo"
echo "############################################################"
echo

kubectl delete -f ./deploy/tempo.yaml
kubectl delete configmap tempo-config
