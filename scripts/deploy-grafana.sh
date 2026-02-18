#!/bin/bash

set -e

cd $(dirname $0)/..

echo
echo "############################################################"
echo "# Deploying Grafana"
echo "############################################################"
echo
kubectl create configmap grafana-provisioning --from-file=./deploy/grafana-datasources.yaml --from-file=./deploy/grafana-dashboards.yaml
kubectl create configmap grafana-dashboards \
    --from-file=./deploy/grafana-dashboard-red-metrics.json \
    --from-file=./deploy/grafana-dashboard-latencies.json

kubectl apply -f ./deploy/grafana.yaml
