#!/bin/sh
set -eu

images=(one two three four five)

for name in "${images[@]}"; do
  docker tag container_sum_$name:latest localhost:5000/$name:$name
  docker push localhost:5000/$name
done
