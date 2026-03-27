.PHONY: verify preflight smoke-plan

verify:
	python3 -m unittest discover -s tests -v
	bash scripts/check_env.sh --ci

preflight:
	bash scripts/bootstrap_ubuntu.sh
	bash scripts/check_aws_cli.sh

smoke-plan:
	bash scripts/s3_smoke.sh --profile book1 --region us-east-1 --plan
