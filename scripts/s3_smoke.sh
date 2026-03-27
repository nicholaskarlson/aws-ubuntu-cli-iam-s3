#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <aws-profile> <bucket-name>" >&2
  exit 1
fi

PROFILE="$1"
BUCKET="$2"

echo "Scaffold-only smoke helper."
echo "Profile: $PROFILE"
echo "Bucket:  $BUCKET"
echo
echo "Planned commands:"
echo "  aws --profile \"$PROFILE\" s3 ls"
echo "  aws --profile \"$PROFILE\" s3 ls \"s3://$BUCKET\""
