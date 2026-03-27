#!/usr/bin/env bash
set -euo pipefail

need_cmd() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
}

need_cmd bash
need_cmd git
need_cmd python3

if [[ "${1:-}" != "--ci" ]]; then
  if command -v aws >/dev/null 2>&1; then
    echo "aws detected: $(aws --version 2>&1)"
  else
    echo "aws CLI not detected yet (acceptable at scaffold stage)"
  fi
fi

echo "OK: env"
