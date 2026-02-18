#!/bin/bash

set -e

cd $(dirname $0)/..

echo "############################################################"
echo "# Start Minikube"
echo "############################################################"
echo

if minikube ip > /dev/null ; then
	echo "Minikube is already running." >&2
else
	# The "containerd" runtime is needed for the Grafana Cloud K8S monitoring plugin.
	# Starting with minikube 1.39.0, "containerd" will be the default container runtime.
	# The current minikube version is 1.38.0, so let's explicitly choose "containerd".
	minikube start --vm=true --nodes 2 --container-runtime=containerd
fi

for node in $(minikube node list | awk '{print $1}') ; do
	if ! minikube ssh -n $node ls /sys/kernel/btf/vmlinux > /dev/null ; then
		echo "eBPF not enabled on node \"$node\". You may need to run the following:" >&2
		echo "minikube ssh -n $node sudo mount bpffs -t bpf /sys/fs/bpf" >&2
		exit 1
	else
		echo "eBPF enabled on minikube node \"$node\"." >&2
	fi
done
