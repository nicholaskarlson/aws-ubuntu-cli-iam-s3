#!/usr/bin/env bash
set -euo pipefail

if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI is not installed or not on PATH." >&2
  exit 1
fi

version_line="$(aws --version 2>&1)"
echo "$version_line"

if [[ "$version_line" != aws-cli/2* ]]; then
  echo "Expected AWS CLI v2." >&2
  exit 1
fi

echo "OK: aws cli"
