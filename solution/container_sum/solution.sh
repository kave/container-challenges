#!/bin/sh

containers=(one two three four five)
answer=0

for x in "${containers[@]}"; do
  addr=$(docker container inspect "$x" | jq -r '.[].NetworkSettings.Ports."80/tcp"[] | "\(.HostIp):\(.HostPort)"')
  answer=$((answer += $(curl --silent "$addr")))
done

echo "Answer: $answer"