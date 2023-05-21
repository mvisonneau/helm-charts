CHARTS             ?= $(shell find charts/* -type d -maxdepth 0)
KUBERNETES_VERSION ?= 1.27.2

.DEFAULT_GOAL := help

.PHONY: lint
lint: docs ## Lint the charts syntax
	pip3 install -r ./.ct/requirements.txt
	go run github.com/helm/chart-testing/v3/ct@v3.8.0 lint --all --config .ct/ct.yaml
	git diff --exit-code

.PHONY: test
test: ## Test installing the charts
	go run github.com/helm/chart-testing/v3/ct@v3.8.0 install --all --config .ct/ct.yaml

.PHONY: docs
docs: ## Generate charts docs
	go run github.com/norwoodj/helm-docs/cmd/helm-docs@v1.11.0

.PHONY: kubeconform
kubeconform: ## Lint the charts templated kubernetes values
	@for chart in $(CHARTS); do \
		helm dependency build $$chart; \
		for values in $$chart/tests/*.yaml; do \
			echo "\ntesting $$values..."; \
			helm template --values $$values $$chart | \
			go run github.com/yannh/kubeconform/cmd/kubeconform@v0.6.1 \
				-strict \
				-kubernetes-version $(KUBERNETES_VERSION); \
		done; \
	done

.PHONY: update-deps
update-deps: ## Update dependencies of the charts
	@for chart in $(CHARTS); do \
		helm dependency update $$chart; \
	done

.PHONY: help
help: ## Displays this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
