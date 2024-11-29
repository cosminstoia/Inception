# Variables
DC = docker compose
FILE = ./srcs/docker-compose.yml

# Default target
all: up

# Start and build containers
up:
	$(DC) -f $(FILE) up

# Stop containers
down:
	$(DC) -f $(FILE) down

# Clean up volumes and networks
clean:
	$(DC) -f $(FILE) down -v

# Delete all the images, containers and the web directory
prune:
	docker system prune -af
	rm -rf ./srcs/web

# Show running containers
ps:
	$(DC) ps
