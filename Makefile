.PHONY: verify

verify:
	python3 -m unittest discover -s tests -v
	bash scripts/check_env.sh --ci
