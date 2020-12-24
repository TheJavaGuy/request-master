#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
readonly SCRIPT_SRC="$(dirname "${BASH_SOURCE[0]}")"
readonly SCRIPT_DIR="$(cd "$SCRIPT_SRC" >/dev/null 2>&1 && pwd)"
readonly STARTED_IN_DIR="$(pwd -P)"
readonly DOCKER_TAG=the-java-guy/request-master
readonly DOCKERFILE=Dockerfile.10-alpine.request-master
cd "$SCRIPT_DIR"
docker build --tag "$DOCKER_TAG" --file "$DOCKERFILE" .
cd "$STARTED_IN_DIR"
