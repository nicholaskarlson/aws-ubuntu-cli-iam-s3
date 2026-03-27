#!/usr/bin/env bash
set -euo pipefail

need_cmd() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
}

if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  echo "Detected OS: ${PRETTY_NAME:-unknown}"
  case "${ID:-}" in
    ubuntu)
      ;;
    *)
      echo "This repo is written for Ubuntu. Continuing, but expect to adapt commands." >&2
      ;;
  esac
else
  echo "Could not detect OS via /etc/os-release" >&2
  exit 1
fi

for cmd in bash git python3 curl unzip; do
  need_cmd "$cmd"
done

echo
echo "Local tool versions:"
bash --version | head -n 1
git --version
python3 --version
curl --version | head -n 1
unzip -v | head -n 1

echo
if command -v aws >/dev/null 2>&1; then
  echo "aws detected:"
  aws --version 2>&1
else
  echo "aws CLI not detected yet."
  echo "Install AWS CLI v2 before attempting the S3 smoke walkthrough."
fi

echo
echo "OK: ubuntu preflight"
