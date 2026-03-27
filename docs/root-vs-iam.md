# Root user versus IAM user

This repo teaches a simple beginner distinction:

- the **root user** is the account-level owner
- an **IAM user** is a regular identity with defined permissions

The root user should not be your routine day-to-day identity for command-line work.

A better beginner pattern is:

1. secure the account
2. understand what the root user is
3. create and use a less-privileged working identity for normal tasks

This document is a placeholder and should be expanded with screenshots or terminal examples only if they stay maintainable.
