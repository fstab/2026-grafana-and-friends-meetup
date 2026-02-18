#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Deploying Prometheus"
echo "############################################################"
echo
kubectl create configmap prometheus-config --from-file=./deploy/prometheus-config.yaml

kubectl apply -f ./deploy/prometheus.yaml
