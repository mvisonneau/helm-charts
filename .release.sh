#!/usr/bin/env bash

helm repo add mvisonneau https://charts.visonneau.fr
helm repo update

cd charts/

for CHART in $(find * -maxdepth 0 -type d)
do
  VERSION=$(grep 'version:' ${CHART}/Chart.yaml | awk '{print $2}')
  helm search repo mvisonneau/${CHART} | grep ${VERSION}
  if [ $? -eq 0 ]
  then
    echo "${CHART} chart version hasn't been bumped (${VERSION})."
  else
    helm package -u ${CHART} -d ../docs
    echo "Released ${CHART} version ${VERSION}."
  fi
done

cd ../docs
helm repo index . --url https://charts.visonneau.fr
