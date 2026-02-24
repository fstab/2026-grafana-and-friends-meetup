#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Deploying the Collector"
echo "############################################################"
echo

kubectl create configmap collector-config --from-file=./deploy/collector-config.yaml
kubectl apply -f ./deploy/collector.yaml
