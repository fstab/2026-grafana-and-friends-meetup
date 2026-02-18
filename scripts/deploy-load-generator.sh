#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Deploying the K6 load generator"
echo "############################################################"
echo

kubectl create configmap load-generator --from-file=./deploy/load-generator.js
kubectl apply -f ./deploy/load-generator.yaml
