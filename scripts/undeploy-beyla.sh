#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Un-Deploying Beyla"
echo "############################################################"
echo

kubectl delete -f ./deploy/beyla.yaml
kubectl delete configmap beyla-config
