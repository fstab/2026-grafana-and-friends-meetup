#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Un-Deploying the Collector"
echo "############################################################"
echo

kubectl delete -f ./deploy/collector.yaml
kubectl delete configmap collector-config
