# Verification for Book 1

This repo should verify four things:

1. Ubuntu is ready.
2. AWS CLI is installed.
3. Credentials are configured for a non-root daily-use identity.
4. A small S3 smoke workflow can be run and cleaned up safely.

## Local checks
- `make verify`
- `bash scripts/check_env.sh`
- `aws --version`

## AWS checks
- `aws sts get-caller-identity`
- `aws s3 ls`

## S3 smoke goal
Create one bucket with a unique name, upload one small text file, list it, download it, and remove it.
