#!/bin/sh
set -e pipefail

BASE_PATH="$(realpath $(dirname $0)/..)"
BUILD_CONTEXT="${BASE_PATH}/docker"

docker build \
    -f "${BUILD_CONTEXT}/original/original.dockerfile" \
    -t "original" \
    "${BUILD_CONTEXT}"

docker build \
    -f "${BUILD_CONTEXT}/multi-stage/multi-stage.dockerfile" \
    -t "multi-stage" \
    "${BUILD_CONTEXT}"