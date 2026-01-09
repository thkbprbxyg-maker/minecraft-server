#!/bin/sh
set -eu

: MC_MEMORY:="2G"
: MC_PORT:="25565"
: MC_JAR_NAME:="server.jar"

echo "Starting Minecraft Server..."
echo "Memory: MC_MEMORY
echo "Port:   MC_PORT
echo "Jar:    MC_JAR_NAME

# Ensure server.properties exists and has the right port (first run)
if [ -f server.properties ]; then
  sed -i "s/^server-port=.*/server-port=${MC_PORT}/" server.properties
else
  echo "server-port=${MC_PORT}" >> server.properties
fi
# Start server (nogui required)
exec java -Xms"${MC_MEMORY}" -Xmx"${MC_MEMORY}" -jar "${MC_JAR_NAME}" nogui
