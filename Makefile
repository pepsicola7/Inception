# Variables
DOCKER_COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml
PROJECT_NAME = inception
LOGIN = peli
DATA_PATH = /home/$(LOGIN)/data
WORDPRESS_VOLUME = $(DATA_PATH)/wordpress
MARIADB_VOLUME = $(DATA_PATH)/mariadb

.PHONY: all stop clean fclean re logs

# --- build & run ---
all: volumes
	@echo "🔼 Lancement des services avec build..."
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d --build

# --- stop services ---
stop:
	@echo "🛑 Arrêt des services..."
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) stop

# --- remove containers but keep images ---
clean: stop
	@echo "🧹 Suppression des conteneurs, volumes et réseaux orphelins..."
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down --volumes --remove-orphans

# --- full reset (⚠️ supprime aussi volumes + cache images inutilisées) ---
fclean: clean
	@echo "🧼 Nettoyage complet du système Docker (⚠️ volumes et cache supprimés)"
	docker system prune -af --volumes 2>/dev/null || true

# --- rebuild ---
re: fclean all

# --- logs ---
logs:
	@echo "📜 Affichage des logs..."
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

# --- create volumes folders ---
volumes:
	@echo "📂 Vérification et création des volumes dans $(DATA_PATH)"
	@mkdir -p $(WORDPRESS_VOLUME)
	@mkdir -p $(MARIADB_VOLUME)
