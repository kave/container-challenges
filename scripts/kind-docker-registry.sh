#!/bin/sh
set -o errexit
# Context: https://kind.sigs.k8s.io/docs/user/local-registry/

# create registry container unless it already exists
registry_name='kind-registry'
registry_port='5000'
kind_network='kind'

running="$(docker inspect -f '{{.State.Running}}' "${registry_name}" 2>/dev/null || true)"
if [ "${running}" != 'true' ]; then
  docker run \
    -d -p "${registry_port}:5000" --name "${registry_name}" --rm \
    registry:2
fi

# create a cluster with the local registry enabled in containerd
kind create cluster --config=kind-config.yml

# connect the registry to the cluster network
containers=$(docker network inspect ${kind_network} -f "{{range .Containers}}{{.Name}} {{end}}")
needs_connect="true"
for c in $containers; do
  if [ "$c" = "${registry_name}" ]; then
    needs_connect="false"
  fi
done
if [ "${needs_connect}" = "true" ]; then
  docker network connect "${kind_network}" "${registry_name}"
fi

# tell https://tilt.dev to use the registry
# https://docs.tilt.dev/choosing_clusters.html#discovering-the-registry
for node in $(kind get nodes); do
  kubectl annotate node "${node}" "kind.x-k8s.io/registry=localhost:${registry_port}";
done
