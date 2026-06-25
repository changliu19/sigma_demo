#!/usr/bin/env bash

set -euo pipefail

IMAGE="${JEKYLL_DOCKER_IMAGE:-ruby:3.3-bookworm}"
CONTAINER_NAME="${JEKYLL_CONTAINER_NAME:-jekyll-theme-yat}"
SITE_PORT="${JEKYLL_PORT:-4000}"
LIVE_RELOAD_PORT="${JEKYLL_LIVERELOAD_PORT:-35729}"
ENABLE_LIVERELOAD="${JEKYLL_ENABLE_LIVERELOAD:-true}"
DOCKER_PLATFORM="${JEKYLL_DOCKER_PLATFORM:-}"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="${PROJECT_DIR}/.bundle-docker"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker 未安装，请先安装 Docker。" >&2
  exit 1
fi

port_in_use() {
  local port="$1"
  lsof -nP -iTCP:"${port}" -sTCP:LISTEN >/dev/null 2>&1
}

resolve_platform() {
  echo "${DOCKER_PLATFORM}"
}

pick_available_port() {
  local port="$1"
  while port_in_use "${port}"; do
    port=$((port + 1))
  done
  echo "${port}"
}

mkdir -p "${BUNDLE_DIR}"

PLATFORM="$(resolve_platform)"
DOCKER_ARGS=(run --rm --name "${CONTAINER_NAME}" -p "${SITE_PORT}:4000" -v "${PROJECT_DIR}:/srv/jekyll" -v "${BUNDLE_DIR}:/usr/local/bundle" -w /srv/jekyll)
JEKYLL_CMD="git config --global --add safe.directory /srv/jekyll && bundle install && bundle exec jekyll serve --host 0.0.0.0 --port 4000"

if [[ -n "${PLATFORM}" ]]; then
  DOCKER_ARGS+=(--platform "${PLATFORM}")
fi

if [[ "${ENABLE_LIVERELOAD}" == "true" ]]; then
  RESOLVED_LIVE_RELOAD_PORT="$(pick_available_port "${LIVE_RELOAD_PORT}")"
  if [[ "${RESOLVED_LIVE_RELOAD_PORT}" != "${LIVE_RELOAD_PORT}" ]]; then
    echo "LiveReload 端口 ${LIVE_RELOAD_PORT} 已被占用，改用 ${RESOLVED_LIVE_RELOAD_PORT}"
  fi
  LIVE_RELOAD_PORT="${RESOLVED_LIVE_RELOAD_PORT}"
  DOCKER_ARGS+=(-p "${LIVE_RELOAD_PORT}:35729")
  JEKYLL_CMD="${JEKYLL_CMD} --livereload --livereload-port 35729"
fi

echo "Using image: ${IMAGE}"
if [[ -n "${PLATFORM}" ]]; then
  echo "Platform: ${PLATFORM}"
fi
echo "Project dir: ${PROJECT_DIR}"
echo "Site URL: http://localhost:${SITE_PORT}"
if [[ "${ENABLE_LIVERELOAD}" == "true" ]]; then
  echo "LiveReload URL: http://localhost:${LIVE_RELOAD_PORT}"
fi

docker "${DOCKER_ARGS[@]}" \
  "${IMAGE}" \
  bash -lc "${JEKYLL_CMD}"
