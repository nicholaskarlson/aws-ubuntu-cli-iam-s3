# AWS on Ubuntu 1 — CLI, IAM, and S3

Public MIT-licensed companion repo for the book:

**AWS on Ubuntu 1: CLI, IAM, and S3**

This repository is designed to teach and document a careful, Ubuntu-first, proof-first beginner workflow for:

- installing AWS CLI on Ubuntu
- understanding the difference between root user and IAM user
- configuring named CLI profiles
- performing basic S3 operations from the command line
- cleaning up safely

## Status

This is the **initial scaffold** for Book 1.

It is not yet the finished teaching repo, but the structure is ready for:

- docs
- scripts
- examples
- tests
- CI
- cost-safety notes
- release tagging

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

## Planned walkthroughs

1. Ubuntu environment check
2. AWS CLI install and version verification
3. AWS root user versus IAM user explanation
4. Named profile setup
5. S3 bucket create/list/upload/sync/remove
6. Cleanup and teardown

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

Before running real AWS commands, read:

- `docs/cost-safety.md`
- `docs/root-vs-iam.md`

## Companion book

The private manuscript repo explains this public repo step by step. The public repo remains useful on its own, but the book provides the narrative path.
