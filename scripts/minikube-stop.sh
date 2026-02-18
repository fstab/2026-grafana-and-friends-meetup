#!/bin/bash

set -e

cd $(dirname $0)/..

echo "############################################################"
echo "# Stopping Minikube"
echo "############################################################"
echo

minikube stop
minikube delete --purge
