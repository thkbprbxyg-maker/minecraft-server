
# minecraft-server
Minecraft Java Edition server running in Docker using a custom Dockerfile and docker-compose setup with persistent world data.

# Minecraft Server (Dockerized)

## Table of Contents
- [Description](#description)
- [Requirements](#requirements)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Configuration](#configuration)
- [Persistence](#persistence)
- [Troubleshooting](#troubleshooting)
- [Security Notes](#security-notes)

## Description
This repository provides a self-built Docker image and docker-compose setup for a Minecraft Java server.
It does NOT use a prebuilt Minecraft Docker image. The official server JAR is downloaded during image build.

## Requirements
- Docker
- Docker Compose
- Java is provided by the Docker image (Eclipse Temurin 21)

## Quickstart
1) Insert the official Minecraft server.jar URL into `docker-compose.yaml` under `MC_SERVER_JAR_URL`.
2) Build & start:
```bash
docker compose up --build

## Usage

.Server will be reachable via:
 . <YOU_VM_IP>:8888

.if you test locally:
 . localhost:8888


 ## Configuration 

 Environment variables (defaults):
 . MC_MEMORY (default: 2G)
 . MC_PORT (default: 25565)

 You can change them in docker-compose.yaml:
 Environment:
 MC_MEMORY: "4G"
 MC_PORT: "25565" 


##Persistence

All server data (world, configs, etc.) is stored in the Docker volume mc-data, mounted to /minecraft.
This ensures data is not lost after container restarts.

Troubleshooting
. Check logs:
```bash
docker compose logs -f

. Rebuild after changing the jar URL:
docker compose up --build 

. Verify container is runing:
```bash
docker ps 


## Security Notes 

. Do not commit secrets, tokens, passwords, SSH keys, or IP addresse to the repository.
. Use environment variables or .env (ignored by git) if needed


## Build & Run

```bash
docker compose up --build

Check availability:
curl -I http://localhost:8888 || true

Minecraft is not an HTTP service, so curl isn't perfect – better:
```bash
docker compose logs -f 

Server = Done

Test persistence
 Run the server once (the world will be created)
 Stop:
 ```bash
docker compose down
 Start:
 ```bash
```bash
docker compose up

 Restart-Policy Test
 Server Kill:
 ```bash
docker kill mc-server
 ```bash
docker ps

 The container should restart automatically (restart: unless-stopped).


##Initialize Git (repository check)

git init
git add .
git commit -m "Initial Minecraft server container setup"


