# Using Docker Swarm Mode

## Setup locally

	docker swarm init

## Recipes

### Setting up Load Balancing with Traefik

Add Traefik as a service:

	docker service create \
		--name traefik \
		--constraint=node.role==manager \
		--publish 80:80 --publish 8080:8080 \
		--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
		traefik:v1.1.0-rc2 \
		--docker \
		--docker.swarmmode \
		--docker.domain=local \
		--docker.watch \
		--web

See also: ["Traefik Swarm Mode Guide"](https://github.com/containous/traefik/blob/v1.1/docs/user-guide/swarm-mode.md)

