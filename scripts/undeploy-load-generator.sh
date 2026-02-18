#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Un-deploying the K6 load generator"
echo "############################################################"
echo

kubectl delete -f ./deploy/load-generator.yaml
kubectl delete configmap load-generator
