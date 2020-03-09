NAME          := charts
REPOSITORY    := mvisonneau/$(NAME)
.DEFAULT_GOAL := help

CHARTS := $(shell find charts/* -type d -maxdepth 0)

.PHONY: lint
lint: ## Lint the charts
	@for chart in $(CHARTS); do helm lint $$chart; done

.PHONY: release
release: ## Release the charts
	./.release.sh

.PHONY: sign-drone
sign-drone: ## Sign Drone CI configuration
	drone sign $(REPOSITORY) --save

.PHONY: help
help: ## Displays this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
