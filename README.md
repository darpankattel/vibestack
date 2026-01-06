# Vibestack - Microservices Architecture

A complete microservices architecture built with Django, Express, Docker, Redis, and PostgreSQL to practice modern development concepts.

## Learning Objectives

This project demonstrates:
- **Docker Networking**: Service discovery and inter-container communication
- **Monorepo Structure**: Multiple services in one repository
- **Microservices Architecture**: Independent, scalable services
- **Message Queues**: Asynchronous task processing with Redis
- **Database Management**: PostgreSQL with schema separation
- **Production-Ready Setup**: Development and production configurations

## Architecture
![System Design](/docs/system-design-dark.png)

## Project Structure

```
vibestack/
├── services/
│   ├── async-service/     # Async apis in Node/Express
│   ├── auth/              # Authentication service
│   ├── backend/           # Main API service
│   └── workers/           # Background job workers
├── frontend/
│   ├── dashboard/         # Admin dashboard
│   └── website/           # Public website
├── infrastructure/
│   ├── nginx/            # Reverse proxy config
│   └── docker/           # Docker Compose files
├── shared/               # Shared utilities
├── docker-compose.yml    # Development config
└── Makefile             # Command shortcuts
```

## Quick Start

### Prerequisites
- Docker Desktop 20.10+ (or just docker for linux)
- Docker Compose 2.0+
- Make (optional)

### Services Overview
### Backend Service (Port 8002)

Handles the core business logic, manages task orchestration, and coordinates with worker services.

Built with **Django** as a **JSON-only API**. All unnecessary components have been removed to keep the service lightweight and fast, including template rendering, session handling, CORS middleware, admin, and authentication-related apps. The default renderer is configured to **JSON only**, ensuring consistent API responses.

**Endpoints:**

* `GET /` - Health checks
* `POST /api/tasks/` — Create a background task
* `GET /api/tasks/{id}/` — Retrieve task status
* `GET /api/queue-info/` — Get queue metadata and health information



## Contributing

This is a vibe and chill project. Feel free to:
- Add more services
- Implement new features
- Improve documentation
- Fix bugs
- Share improvements

## License

MIT License - feel free to use this for learning!

## Acknowledgments

Built as a project to learn:
- Microservices architecture
- Docker containerization
- Message queue systems
- Modern web development practices

---

**Happy Learning!**