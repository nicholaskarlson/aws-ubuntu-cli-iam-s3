# AWS account setup checklist

This repo assumes the reader protects the AWS account before doing any daily work.

## Required safety steps
- [ ] Sign in as root only for account-owner tasks
- [ ] Enable MFA on the root user
- [ ] Do not create root access keys
- [ ] Create a separate admin identity for normal work
- [ ] Enable billing alerts
- [ ] Enable budget and anomaly notifications
- [ ] Use a named CLI profile for daily work

## Book 1 rule
Root is for account ownership.
Daily AWS work is done with a non-root identity.
