.DEFAULT_GOAL := help
# https://github.com/instrumenta/kubernetes-json-schema
KUBEVAL_SCHEMA_VERSION := 1.21.0
KUBEVAL_SCHEMA_LOCATION := https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/
CHARTS := $(shell find charts/* -type d -maxdepth 0)

.PHONY: lint-charts
lint-charts: ## Lint the charts syntax
	ct lint --all

.PHONY: docs
docs: ## Generate charts docs
	helm-docs

.PHONY: lint-kubeval
lint-kubeval: ## Lint the charts templated kubernetes values
	@for chart in $(CHARTS); do \
		helm dependency build $$chart; \
		helm template --values $$chart/tests/kubeval.yaml $$chart | \
		kubeval \
			--strict \
			-v $(KUBEVAL_SCHEMA_VERSION) \
			-s $(KUBEVAL_SCHEMA_LOCATION); \
	done

.PHONY: update-deps
update-deps: ## Update dependencies of the charts
	@for chart in $(CHARTS); do \
		helm dependency update $$chart; \
	done

.PHONY: help
help: ## Displays this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
