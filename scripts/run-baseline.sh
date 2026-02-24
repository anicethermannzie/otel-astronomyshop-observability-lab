#!/usr/bin/env bash
set -euo pipefail

# Run the upstream demo using the instructor baseline compose file(s)
cd "$(dirname "$0")/../deploy/instructor-base"

# Prefer docker-compose.yml if present
if [ -f docker-compose.yml ]; then
  docker compose -f docker-compose.yml up -d
elif [ -f docker-compose.yaml ]; then
  docker compose -f docker-compose.yaml up -d
else
  echo "No docker-compose.yml/.yaml found in deploy/instructor-base"
  exit 1
fi

docker compose ps
