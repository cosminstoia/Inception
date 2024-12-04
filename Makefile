# Variables
DC = docker-compose
FILE = ./srcs/docker-compose.yml
DATA_DIR = $(HOME)/data
DB_DIR = $(DATA_DIR)/db
WEB_DIR = $(DATA_DIR)/web

# Default target
all: up

# Start and build containers
up:
	$(DC) -f $(FILE) up -d

# Stop containers
down:
	$(DC) -f $(FILE) down

# Clean up volumes and networks
clean:
	$(DC) -f $(FILE) down -v

# Delete all the images, containers and the web directory
prune:
	docker system prune -af
#	rm -rf $(HOME)/data

# Show running containers
ps:
	$(DC) ps

init:
	@mkdir -p $(DB_DIR) $(WEB_DIR)
	@echo "Directory structure initialized: $(DATA_DIR), $(DB_DIR), $(WEB_DIR)"