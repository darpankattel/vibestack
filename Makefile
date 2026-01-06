.PHONY: help setup dev-up dev-down logs clean build prod-up prod-down

help:
	@echo "Available commands:"
	@echo "  make setup      - Initial project setup"
	@echo "  make dev-up     - Start development environment"
	@echo "  make dev-down   - Stop development environment"
	@echo "  make logs       - View logs from all services"
	@echo "  make build      - Build all Docker images"
	@echo "  make clean      - Remove containers and volumes"
	@echo "  make prod-up    - Start production environment"
	@echo "  make prod-down  - Stop production environment"

setup:
	@echo "Setting up project..."
	@cp .env.example .env
	@echo "Created .env file"
	@echo "Please edit .env file with your configuration"
	@echo "Then run: make dev-up"

dev-up:
	@echo "Starting development environment..."
	docker-compose up -d
	@echo "Services started"
	@echo "Website: http://localhost"
	@echo "Dashboard: http://localhost/dashboard"
	@echo "Backend API: http://localhost/api/"

dev-down:
	@echo "Stopping development environment..."
	docker-compose down

logs:
	docker-compose logs -f

logs-backend:
	docker-compose logs -f backend

build:
	@echo "Building Docker images..."
	docker-compose build

clean:
	@echo "Cleaning up containers and volumes..."
	docker-compose down -v
	@echo "Cleanup complete"

restart:
	@echo "Restarting services..."
	docker-compose restart

shell-backend:
	docker-compose exec backend /bin/bash

db-shell:
	docker-compose exec postgres psql -U postgres -d vibestack_db

migrate-backend:
	docker-compose exec backend python manage.py migrate

test:
	@echo "Running tests..."
	docker-compose exec backend python manage.py test

prod-up:
	@echo "Starting production environment..."
	docker-compose -f infrastructure/docker/docker-compose.prod.yml up -d
	@echo "Production services started"

prod-down:
	docker-compose -f infrastructure/docker/docker-compose.prod.yml down