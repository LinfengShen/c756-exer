#!/usr/bin/env bash
# Build the S1 service for CI
set -o nounset
set -o errexit
if [[ $# -ne 3 ]]; then
  echo "Usage: ${0} CREG REGID VER"
  echo "Build the S1 service for use in CI"
  echo "  CREG Container registry"
  echo "  REGID Userid for container registry"
  echo "  VER Version"
  exit 1
fi
set -o xtrace
docker build -t ${1}/${2}/cmpt756s1:${3} ../s1
