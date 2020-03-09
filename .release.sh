#!/usr/bin/env bash

git checkout test -- charts/
cd charts/

helm repo add mvisonneau https://charts.visonneau.fr
helm repo update

for CHART in $(find * -maxdepth 0 -type d)
do
  VERSION=$(grep 'version:' ${CHART}/Chart.yaml | awk '{print $2}')
  helm search repo mvisonneau/${CHART} | grep ${VERSION}
  if [ $? -eq 0 ]
  then
    echo "${CHART} chart version hasn't been bumped (${VERSION})."
  else
    helm package -u ${CHART} -d ..
    echo "Released ${CHART} version ${VERSION}."
  fi
done

cd ..
helm repo index --url https://charts.visonneau.fr . 
