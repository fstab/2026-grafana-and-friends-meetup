#!/bin/bash

set -e

cd $(dirname $0)/..

echo "############################################################"
echo "# Test Docker Login"
echo "############################################################"
echo

if ! podman login --get-login docker.io ; then
	echo "Not logged in to Docker Hub. Please run the following command:" >&2
	echo "podman login docker.io" >&2
	exit 1
else
	echo Docker setup verified.
fi

for service in frontend grot-db mysql ; do
	echo
	echo "############################################################"
	echo "# Building $service"
	echo "############################################################"
	echo
	cd ./demo/$service
	podman build -t 2026-grafana-and-friends-munich_$service .
	cd ../..
done

for service in frontend grot-db mysql ; do
	echo
	echo "############################################################"
	echo "# Pushing $service to Docker Hub"
	echo "############################################################"
	echo
	podman tag 2026-grafana-and-friends-munich_$service docker.io/fstab/2026-grafana-and-friends-munich_$service
	podman push docker.io/fstab/2026-grafana-and-friends-munich_$service
done
