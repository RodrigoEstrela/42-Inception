# Variables
DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml
NGINX_DOCKERFILE := requirements/nginx/Dockerfile
WORDPRESS_DOCKERFILE := requirements/wordpress/Dockerfile
MARIADB_DOCKERFILE := requirements/mariadb/Dockerfile

# Build the Docker images
build:
	$(DOCKER_COMPOSE) build

# Run the Docker containers
up:
	$(DOCKER_COMPOSE) up -d

# Stop the Docker containers
down:
	$(DOCKER_COMPOSE) down

# Remove the Docker containers and volumes
clean:
	$(DOCKER_COMPOSE) down -v

# generate certificates
ssl:
	@if [ ! -f srcs/requirements/nginx/tools/nginx.key ] && [ ! -f srcs/requirements/nginx/tools/nginx.crt ]; then \
		mkdir -p srcs/requirements/nginx/tools/; \
		openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout nginx.key -out nginx.crt -subj "/C=PT/ST=Lisbon/L=Lisboa/CN=rdas-nev.42.fr" >/dev/null 2>&1; \
		mv nginx.key srcs/requirements/nginx/tools/; \
		mv nginx.crt srcs/requirements/nginx/tools/; \
	fi


# Build individual Docker images
build-nginx:
	docker build -t my-nginx -f $(NGINX_DOCKERFILE) srcs/requirements/nginx

build-wordpress:
	docker build -t my-wordpress -f $(WORDPRESS_DOCKERFILE) srcs/requirements/wordpress

build-mariadb:
	docker build -t my-mariadb -f $(MARIADB_DOCKERFILE) srcs/requirements/mariadb

# Default target when running 'make' command
all: build

.PHONY: build up down clean build-nginx build-wordpress build-mariadb all

