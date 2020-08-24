#!/bin/sh
set -eu

kind delete cluster --name kind
docker stop kind-registry
docker network rm kind
echo "Resources cleaned up!"
