FROM eclipse-temurin:21-jre

# Default configuration (can be overridden by docker-compose env vars)
ENV MC_PORT=25565 \
    MC_MEMORY=2G \
    MC_JAR_NAME=server.jar

WORKDIR /minecraft

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Build argument: where to download the official Minecraft server jar
ARG MC_SERVER_JAR_URL
ENV MC_SERVER_JAR_URL=${MC_SERVER_JAR_URL}

# Fail build if URL is missing (prevents "build succeeds but server doesn't start" issues)
RUN if [ -z "$MC_SERVER_JAR_URL" ]; then \
      echo "ERROR: MC_SERVER_JAR_URL build-arg is required."; \
      echo "Provide it via docker compose build args."; \
      exit 1; \
    fi \
 && curl -fsSL "$MC_SERVER_JAR_URL" -o "$MC_JAR_NAME"

# Accept EULA (required for server start)
RUN echo "eula=true" > eula.txt

# A small start script keeps CMD clean and allows validation/defaults
COPY scripts/start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 25565

CMD ["/start.sh"]