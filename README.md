# AWS on Ubuntu 1 — CLI, IAM, and S3

Public MIT-licensed companion repo for the book:

**AWS on Ubuntu 1: CLI, IAM, and S3**

This repository teaches a careful, Ubuntu-first, proof-first beginner workflow for:

- installing and verifying AWS CLI v2 on Ubuntu
- understanding the difference between the root user and a daily-use IAM identity
- configuring a named AWS CLI profile
- performing a small S3 smoke walkthrough from the command line
- cleaning up safely

## Status

This repo is now past the bare scaffold stage.

Current milestone:
- account-safety notes are in place
- verification docs are in place
- environment and CLI helper scripts are in place
- a safe S3 smoke helper exists with plan mode and execute mode

Next milestone:
- validate the first real walkthrough against a fresh AWS account configured for daily non-root CLI use
- capture deterministic receipts for the book

## Intended audience

A careful beginner who wants:

- Ubuntu-first steps
- terminal-first AWS learning
- minimal spend
- explicit cleanup
- a repo that is worth studying

## Quick verification

```bash
make verify
```

## Local preflight

```bash
bash scripts/bootstrap_ubuntu.sh
bash scripts/check_aws_cli.sh
```

## Planned learning arc

1. Ubuntu environment check
2. AWS account safety and billing guardrails
3. AWS CLI install and version verification
4. Root user versus IAM explanation
5. Named profile setup
6. S3 bucket create/upload/list/download/remove
7. Cleanup and teardown

## S3 smoke example

Plan only:

```bash
bash scripts/s3_smoke.sh --profile book1 --region us-east-1 --plan
```

Real execution:

```bash
bash scripts/s3_smoke.sh --profile book1 --region us-east-1 --execute
```

The script creates a unique temporary bucket name, uploads one small text file, lists it, downloads it, deletes it, and removes the bucket.

## Repo layout

```text
.
├── .github/workflows/ci.yml
├── LICENSE
├── Makefile
├── README.md
├── docs/
├── examples/
├── fixtures/
├── receipts/
├── scripts/
└── tests/
```

## Cost-safety posture

This repo is intentionally conservative.

Read these first:

- `docs/cost-safety.md`
- `docs/root-vs-iam.md`
- `docs/account-setup-checklist.md`
- `docs/verify.md`

## Companion book

The private manuscript repo explains this public repo step by step. The public repo remains useful on its own, but the book provides the narrative path.
