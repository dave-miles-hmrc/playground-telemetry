DOCKER_HOST_IP=$(shell ip route get 1.2.3.4 | cut -f7 -d' ')

config:
	@env DOCKER_HOST_IP=$(DOCKER_HOST_IP) docker-compose -f docker-compose.yml -f docker-compose.local.yml config
.PHONY: config

up:
	env DOCKER_HOST_IP=$(DOCKER_HOST_IP) docker-compose -f docker-compose.yml -f docker-compose.local.yml  up -d
.PHONY: up

down:
	docker-compose down
.PHONY: down

clean:
	-sudo rm -fr connectors/*
	-sudo rm -fr full-stack/zoo1/*
	-sudo rm -fr full-stack/kafka1/*
.PHONY: clean

ps:
	@docker ps --format '{{.Image}} {{.ID}} {{.Ports}}' | column -t | sort -k 1
.PHONY: ps
