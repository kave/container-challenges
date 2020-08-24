#!/bin/sh
set -eu

terraform destroy -force
kind delete cluster --name kind
docker stop kind-registry
docker network rm kind
echo "Resources cleaned up!"
