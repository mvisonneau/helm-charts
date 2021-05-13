#!/usr/bin/env bash

# copied from / credits to https://github.com/DataDog/helm-charts/blob/master/.github/kubeval.sh

set -euox pipefail

CHART_DIRS="$(find charts/* -type d -maxdepth 0)"
KUBEVAL_VERSION="0.16.1"
SCHEMA_LOCATION="https://kubernetesjsonschema.dev/"

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
tar -xf /tmp/kubeval.tar.gz kubeval

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  helm dep up "${CHART_DIR}" && helm template --values "${CHART_DIR}"/tests/kubeval.yaml "${CHART_DIR}" | ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done