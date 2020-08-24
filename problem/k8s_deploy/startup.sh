#!/bin/sh
set -eu

echo "Setting up environment"
../../scripts/kind-docker-registry.sh
../../scripts/prep_images.sh

terraform init
terraform apply -auto-approve