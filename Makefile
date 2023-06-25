.DEFAULT_GOAL := help
SHELL := /bin/bash

# .PHONY is a prefix for commands that are not associated with files and dont generate any. Also to avoid confusion so we know it's not a filename and get priority.
.PHONY: help
help:
	@echo "Available commands:"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""

.PHONY: push
push: ## Push changes to Git
	@read -p "Enter commit message: " message; \
	git add .; \
	git commit -m "$$message"; \
	git push origin

.PHONY: test
test: ## Run tests
	@echo "Running tests..."

.PHONY: clean
clean: ## Clean up generated files
	@echo "Cleaning up..."

# Add more commands and rules as needed