# mvisonneau/charts

[![Build Status](https://cloud.drone.io/api/badges/mvisonneau/charts/status.svg)](https://cloud.drone.io/mvisonneau/charts)

## Usage

```bash
~$ helm repo add mvisonneau 'https://charts.visonneau.fr/'
~$ helm repo update
~$ helm search repo mvisonneau/generic-app
NAME                  	CHART VERSION	APP VERSION	DESCRIPTION
mvisonneau/generic-app	0.0.1        	0.0.0      	Generic Application Chart
```

## Release new chart or chart version

> repository : https://github.com/mvisonneau/charts

```bash
~$ make release
~$ git add .
~$ git commit -m 'New chart version'
```
