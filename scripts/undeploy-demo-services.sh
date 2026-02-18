#!/bin/bash

set -e

cd $(dirname $0)/..

# The demo images are pulled from docker.hub/fstab.
# Run the following to build the images from source and upload them to Docker Hub:
#
# ./scripts/build.sh

echo
echo "############################################################"
echo "# Un-Deploying the demo"
echo "############################################################"
echo

kubectl delete \
	-f ./deploy/frontend.yaml \
	-f ./deploy/grot-db.yaml \
	-f ./deploy/mysql.yaml
