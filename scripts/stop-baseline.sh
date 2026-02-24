#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../deploy/instructor-base"

if [ -f docker-compose.yml ]; then
  docker compose -f docker-compose.yml down
elif [ -f docker-compose.yaml ]; then
  docker compose -f docker-compose.yaml down
else
  echo "No docker-compose.yml/.yaml found in deploy/instructor-base"
  exit 1
fi
