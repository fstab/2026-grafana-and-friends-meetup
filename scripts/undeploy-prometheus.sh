#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Un-Deploying Prometheus"
echo "############################################################"
echo

kubectl delete -f ./deploy/prometheus.yaml
kubectl delete configmap prometheus-config
