
# Minecraft Server
Minecraft Java Edition server running in Docker using a custom Dockerfile and docker-compose setup with persistent world data.
This repository provides a self-built Docker image and docker-compose setup for a Minecraft Java server.
It does NOT use a prebuilt Minecraft Docker image. The official server JAR is downloaded during image build.

## Table of Contents
- [Description](#description)
- [Requirements](#requirements)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Configuration](#configuration)
- [Persistence](#persistence)
- [Troubleshooting](#troubleshooting)
- [Security Notes](#security-notes)


## Requirements
<<<<<<< HEAD
- Docker
- Docker Compose

## Quickstart

1. Clone repository
```   
git clone https://github.com/<thkbprbxyg-maker
>/minecraft-server.git
cd minecraft-server
```

Create .env file

Create a .env file in the project root with the following content:
MC_MEMORY=2G
MC_PORT=25565
MC_SERVER_JAR_URL=https://piston-data.mojang.com/v1/objects/<HASH>/server.jar

Start the server:
```
docker compose up --build
```

Note:
The .env file is not committed to the repository and must be created manually.

2) Insert the official Minecraft server.jar URL into `docker-compose.yaml` under `MC_SERVER_JAR_URL`.
3) Build & start:
=======
To run this project locally, the following requirements must be met:

1. Operating System 

- macos, Linux or Windows 
- Windows useres must use Docker Desktop with WSL2 enable 

2. Docker
- Docker Engine must be installed and running
- Minimum recommended version: Docker 20.x or newer

Check if Docker is installed:
```
docker --version 
```
If Docker is not installed, follow the official installation guide:
https://docs.docker.com/get-docker/

3. Docker Compose

- Docker Compose v2 is required
- Docker Compose is included by default in Docker Desktop

Check if Docker Compose is available:
```
docker compose version 
```

Note:
This project uses the new docker compose command (without a dash), not docker-compose.

4. Git

- Git is required to clone the repository

Check if Git is installed:
```
git --vesion
```
Download Git if needed:
https://git-scm.com/downloads

5. Minecraft Java Edition (Client)

- Minecraft Java Edition is required to connect to the server
- Version must be compatible with the server version

 Bedrock Edition is not supported

6. System Resources (Recommended)

- RAM: at least 4 GB (Minecraft server uses 2 GB by default)
- Disk space: ~2 GB free space
- Internet connection (to download the official server.jar)

7. Network / Ports
- Port 25565 must be available on your system
- If running locally:
- Connect via localhost:25565
- If running on a remote server:
- The port must be opened in the firewall


## Quickstart
>>>>>>> 1d3e3bd (docs: improve README and quickstart; use env-based configuration)

### 1. Clone the repository
```bash
git clone git@github.com:thkbprbxyg-maker/minecraft-server.git
cd minecraft-server
```

2. Create your .env file

This project uses environment variables for configuration.

An example file is provided:
```
cp example.env .env 
```
Important:
You must edit the .env file and adjust the values to your own setup.
The .env file is not committed to the repository and may contain sensitive values.

Example .env:
```
MC_MEMORY=2G
MC_PORT=25565
MC_SERVER_JAR_URL=https://piston-data.mojang.com/...
```

3. Build and start the server
```
docker compose up --build 
```
The Minecraft server will start automatically inside a Docker container.

4. Connect to the server
	•	Local setup:
localhost:25565
	•	Remote server:
<YOUR_SERVER_IP>:25565
(Make sure the port is open in your firewall)

Use Minecraft Java Edition to connect.


## Usage

<<<<<<< HEAD
Server will be reachable via:
 ```
 better http://<YOUR_IP>:8888
```

=======
.Server will be reachable via:
 . <YOU_VM_IP>:25565

.if you test locally:
 . localhost:25565
>>>>>>> 1d3e3bd (docs: improve README and quickstart; use env-based configuration)


 ## Configuration 

 Environment variables (defaults):
 . MC_MEMORY (default: 2G)
 . MC_PORT (default: 25565)

 You can change them in docker-compose.yaml:
 Environment:
 MC_MEMORY: "4G"
 MC_PORT: "25565" 


## Persistence

All server data (world, configs, etc.) is stored in the Docker volume mc-data, mounted to /minecraft.
This ensures data is not lost after container restarts.

Troubleshooting
. Check logs:

```
docker compose logs -f
```

 Rebuild after changing the jar URL:
```
docker compose up --build
 ```

 Verify container is runing:

```
docker ps
 ```


## Security Notes 

 Do not commit secrets, tokens, passwords, SSH keys, or IP addresse to the repository.
 Use environment variables or .env (ignored by git) if needed


## Build & Run

```
docker compose up --build
```

Check availability:
<<<<<<< HEAD
```
curl -I http://localhost:8888 || true
```
=======
curl -I http://localhost:25565 || true
>>>>>>> 1d3e3bd (docs: improve README and quickstart; use env-based configuration)

Minecraft is not an HTTP service, so curl isn't perfect – better:

```
docker compose logs -f
```

Server = Done

Test persistence
 Run the server once (the world will be created)
 Stop:

 ```
docker compose down
```
 Start:

 ```
docker compose up
```

 Restart-Policy Test
 Server Kill:

 ```
docker kill mc-server
```

 ```
docker ps
```

 The container should restart automatically (restart: unless-stopped).



<<<<<<< HEAD



=======
>>>>>>> 1d3e3bd (docs: improve README and quickstart; use env-based configuration)
