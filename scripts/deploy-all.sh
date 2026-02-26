#!/bin/bash

set -e

cd $(dirname $0)/..

# The demo images are pulled from docker.hub/fstab.
# Uncomment the following to build the images from source and
# upload them to docker hub.
#
# ./scripts/build.sh

echo "############################################################"
echo "# Testing if Kubernetes is running"
echo "############################################################"
echo

if ! kubectl get nodes ; then
▸·······echo "Kubernetes is not running. kubectl get nodes failed." >&2
▸·······exit 1
fi

./scripts/deploy-tempo.sh
./scripts/deploy-prometheus.sh
./scripts/deploy-grafana.sh
./scripts/deploy-collector.sh
./scripts/deploy-demo-services.sh
./scripts/deploy-load-generator.sh
./scripts/deploy-beyla.sh

echo
echo "Success!"
echo "grot-db may fail if mysql isn't running yet. The CrashLoopBackOff will fix this automatically once the database is up."
echo "frontend may fail if grot-db isn't running yet. The CrashLoopBackOff will fix this automatically once grot-db is up."
echo "Run the following command to expose Grafana on http://localhost:3000"
echo "kubectl port-forward \$(kubectl get pods -lapp=grafana -o=name) 3000:3000"
