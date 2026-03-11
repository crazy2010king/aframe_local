#!/bin/bash

# Default port
PORT=8000

# Allow custom port as argument
if [ ! -z "$1" ]; then
  PORT=$1
fi

echo "Starting A-Frame examples server on port $PORT"
echo "Access the examples at: http://localhost:$PORT/examples/"

# Start Python HTTP server from local directory
cd "$(dirname "$0")/.." && python3 -m http.server $PORT
