COMPOSE_FILE = ./src/docker-compose.yml
PROJECT_NAME = inception
PORT ?= 8443
DOCKER_COMPOSE = docker compose

.PHONY: build up down restart logs prune clean rebuild re log

up:
	@echo "🔼 Démarrage des services sur le port $(PORT)..."
	# @sed "s/REPLACE_PORT/$(PORT)/g" $(COMPOSE_FILE) > $(COMPOSE_FILE)
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d --build

down:
	@echo "🧹 Arrêt des services"
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down || true
	docker network rm $(PROJECT_NAME)_inception_network || true

prune:
	@echo "🧼 Nettoyage complet"
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down -v --remove-orphans
	docker volume prune -f	
	docker container prune -f

logs:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

restart: down up

clean:
	docker stop $$(docker ps -aq) || true
	docker rm $$(docker ps -a -q) || true
	docker rmi -f $$(docker images -q) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network prune -f 

re:
	@echo "⏹️ Arrêt de tous les services"
	-$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down
	@echo "🧽 Nettoyage des images et des volumes"
	docker system prune -af
	docker volume prune -f
	@echo "🔨 Construction des images sans cache"
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build --no-cache
	@echo "🚀 Démarrage des services"
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d
	@echo "✅ Done :)"

rebuild:
	@if [ -z "$(name)" ]; then \
		echo "❌ Error: please provide a container name (e.g. 'make rebuild name=backend')"; \
		exit 1; \
	fi
	@echo "🔨 Rebuilding container: $(name)"
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build --no-cache $(name)
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d $(name)

log:
	@if [ -z "$(name)" ]; then \
		echo "❌ Error: please provide a container name (e.g. 'make log name=backend')"; \
		exit 1; \
	fi
	@echo "📜 Displaying logs for container: $(name)"
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f $(name)
