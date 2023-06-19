# Variables
DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml
NGINX_DOCKERFILE := srcs/requirements/nginx/Dockerfile.nginx
WORDPRESS_DOCKERFILE := srcs/requirements/wordpress/Dockerfile.wordpress
MARIADB_DOCKERFILE := srcs/requirements/mariadb/Dockerfile.mariadb

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

