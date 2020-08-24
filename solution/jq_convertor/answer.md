# Solution

`docker network inspect kind | jq " .[] .Containers | to_entries | map_values(.value)[] .Name"`