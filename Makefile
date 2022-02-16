.PHONY: docs


docs:
	rm -rf docs/_build
	cd docs && pipenv run make livehtml