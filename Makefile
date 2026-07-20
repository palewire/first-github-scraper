UV := uv run

.PHONY: docs


docs:
	rm -rf docs/_build
	cd docs && uv run make livehtml