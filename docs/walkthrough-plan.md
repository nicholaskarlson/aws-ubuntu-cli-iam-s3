# Walkthrough plan

This file defines the first teaching path for Book 1.

## Walkthrough 1 — Ubuntu preflight

Goal:
confirm that the local machine is ready before touching AWS.

Required tools:
- bash
- git
- python3
- curl
- unzip

Local checks:
- `bash scripts/check_env.sh`
- `bash scripts/bootstrap_ubuntu.sh`

## Walkthrough 2 — AWS account safety

Goal:
protect the account before any daily CLI use.

Required ideas:
- root is for account ownership, not daily work
- MFA belongs on the root user
- normal CLI work uses a non-root identity
- budget and anomaly notifications come before experimentation

Reference docs:
- `docs/root-vs-iam.md`
- `docs/account-setup-checklist.md`
- `docs/cost-safety.md`

## Walkthrough 3 — AWS CLI verification

Goal:
verify that AWS CLI v2 is installed and callable from Ubuntu.

Checks:
- `aws --version`
- `bash scripts/check_aws_cli.sh`

## Walkthrough 4 — Named profile setup

Goal:
use a named CLI profile such as `book1-admin` for daily work.

Checks:
- `aws configure --profile book1-admin`
- `aws sts get-caller-identity --profile book1-admin`

## Walkthrough 5 — S3 smoke flow

Goal:
run one safe end-to-end object-storage exercise.

Plan mode:
- `bash scripts/s3_smoke.sh --profile book1-admin --region ca-central-1 --plan`

Execute mode:
- `bash scripts/s3_smoke.sh --profile book1-admin --region ca-central-1 --execute`

Expected flow:
- create a unique bucket
- upload one small file
- list the object
- download the object
- delete the object
- remove the bucket

## Walkthrough 6 — Receipts and cleanup

Goal:
leave no stray resources behind and preserve simple proof that the walkthrough worked.

Outputs to capture later:
- command transcript
- bucket name used
- aws caller identity summary
- verification notes
