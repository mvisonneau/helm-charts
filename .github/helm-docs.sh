#!/usr/bin/env bash

# copied from / credits to https://github.com/DataDog/helm-charts/blob/master/.github/helm-docs.sh

set -euox pipefail

HELM_DOCS_VERSION="1.11.0"
OS=$(uname)

# install helm-docs
curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/norwoodj/helm-docs/releases/download/v"${HELM_DOCS_VERSION}"/helm-docs_"${HELM_DOCS_VERSION}"_${OS}_x86_64.tar.gz
tar -xf /tmp/helm-docs.tar.gz helm-docs

# validate docs
./helm-docs
git diff --exit-code