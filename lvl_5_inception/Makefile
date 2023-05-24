COMPOSE_FILE_PATH=./srcs/docker-compose.yml

#!TODO uncomment the nnuno-ca paths
# comment kuninoto

all: build up_detached

build:
#	Create expected directories for the Docker volumes

#	@mkdir -p /home/nnuno-ca/data;
#	@mkdir -p /home/nnuno-ca/data/mariadb_data /home/nnuno-ca/data/wordpress_data;

	@mkdir -p /home/kuninoto/data;
	@mkdir -p /home/kuninoto/data/mariadb_data /home/kuninoto/data/wordpress_data;

	@if ! [ -f srcs/.env ]; then \
		echo "Inception: error: .env file not found, please provide one like the example \".env.example\""; \
		exit 1; \
	fi
#   --no-cache prevents the docker compose from pulling the 
#   official images for the services (e.g the official Nginx image)
	docker-compose -f $(COMPOSE_FILE_PATH) build --no-cache

up_detached: 
	docker-compose -f $(COMPOSE_FILE_PATH) up -d

up: 
	docker-compose -f $(COMPOSE_FILE_PATH) up

down:
	docker-compose -f $(COMPOSE_FILE_PATH) down

start:
	docker-compose -f $(COMPOSE_FILE_PATH) start

stop:
	docker-compose -f $(COMPOSE_FILE_PATH) stop

ps:
	docker-compose -f $(COMPOSE_FILE_PATH) ps

rm: stop
	docker-compose -f $(COMPOSE_FILE_PATH) rm

rmi: stop
	docker-compose -f $(COMPOSE_FILE_PATH) down --rmi all

delete_volumes:
	docker-compose -f $(COMPOSE_FILE_PATH) down --volumes

re: rm rmi delete_volumes all ps

fclean: rm rmi

.PHONY: all build up up_detached down start stop ps rm delete_volumes
