# Container Challenges

## Requirements
- [Docker](https://docs.docker.com/get-docker/)
    - [docker-compose](https://docs.docker.com/compose/install/)
- [Kind](https://kind.sigs.k8s.io/)
- [JQ](https://stedolan.github.io/jq/)

Configure enviroment
`./startup.sh`

To clean up enviroment
`./teardown.sh`

# Challenges
## 1. Sum the containers
The spun up containers will respond with an integer on port 80. Sum the values and provide the result.
```
cd problem/container_sum
docker-compose up
```
Feel free to use any language/framework you want, but if you opt to use non-default OSX libs please provide instructions to install.

## 2. k8s terraform -> yaml
Convert the following k8s environment from terraform into native k8s .yaml. Such that I can swap out the `terraform apply` in
the `startup.sh` with a `kubectl apply <yamls>` and have an equivalent environment.

##  3. Convert docker commands -> JQ
`docker network inspect kind  --format "{{range .Containers}}{{.Name}} {{end}}"`