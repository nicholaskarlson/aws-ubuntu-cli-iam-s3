#!/usr/bin/env bash
set -euo pipefail

PROFILE=""
REGION=""
MODE="plan"

usage() {
  cat <<'EOF'
Usage:
  bash scripts/s3_smoke.sh --profile <name> --region <aws-region> --plan
  bash scripts/s3_smoke.sh --profile <name> --region <aws-region> --execute

Notes:
- Plan mode prints the commands without running them.
- Execute mode creates a unique temporary bucket, uploads one small file,
  downloads it, deletes it, and removes the bucket.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      PROFILE="${2:-}"
      shift 2
      ;;
    --region)
      REGION="${2:-}"
      shift 2
      ;;
    --plan)
      MODE="plan"
      shift
      ;;
    --execute)
      MODE="execute"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$PROFILE" || -z "$REGION" ]]; then
  usage >&2
  exit 1
fi

if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI is required." >&2
  exit 1
fi

stamp="$(date -u +%Y%m%d%H%M%S)"
suffix="$(python3 - <<'PY'
import random
print(f"{random.randrange(16**6):06x}")
PY
)"
bucket="book1-${PROFILE,,}-${stamp}-${suffix}"
bucket="${bucket//_/-}"

workdir="$(mktemp -d)"
upload_file="${workdir}/hello.txt"
download_file="${workdir}/hello.downloaded.txt"

printf 'book1 smoke test\n' > "$upload_file"

run_cmd() {
  if [[ "$MODE" == "plan" ]]; then
    printf '+ '
    printf '%q ' "$@"
    printf '\n'
  else
    "$@"
  fi
}

echo "Mode:    $MODE"
echo "Profile: $PROFILE"
echo "Region:  $REGION"
echo "Bucket:  $bucket"
echo

create_bucket() {
  if [[ "$REGION" == "us-east-1" ]]; then
    run_cmd aws --profile "$PROFILE" --region "$REGION" s3api create-bucket --bucket "$bucket"
  else
    run_cmd aws --profile "$PROFILE" --region "$REGION" s3api create-bucket --bucket "$bucket" --create-bucket-configuration "LocationConstraint=$REGION"
  fi
}

delete_bucket() {
  run_cmd aws --profile "$PROFILE" --region "$REGION" s3 rb "s3://$bucket"
}

cleanup() {
  if [[ "$MODE" == "execute" ]]; then
    rm -rf "$workdir"
  else
    echo "Plan mode left temporary workdir in place:"
    echo "  $workdir"
  fi
}
trap cleanup EXIT

create_bucket
run_cmd aws --profile "$PROFILE" --region "$REGION" s3 cp "$upload_file" "s3://$bucket/hello.txt"
run_cmd aws --profile "$PROFILE" --region "$REGION" s3 ls "s3://$bucket"
run_cmd aws --profile "$PROFILE" --region "$REGION" s3 cp "s3://$bucket/hello.txt" "$download_file"
run_cmd aws --profile "$PROFILE" --region "$REGION" s3 rm "s3://$bucket/hello.txt"
delete_bucket

if [[ "$MODE" == "execute" ]]; then
  echo
  echo "OK: s3 smoke complete"
else
  echo
  echo "OK: plan rendered"
fi
