# mvisonneau/charts

https://github.com/mvisonneau/charts

```bash
~$ helm package <chart_path>
~$ helm repo index .
~$ git add .
~$ git commit -m 'New chart version'
```

# Usage

```bash
~$ helm repo add mvisonneau 'https://charts.visonneau.fr/'
~$ helm repo update
~$ helm search repo mvisonneau/generic-app
NAME                  	CHART VERSION	APP VERSION	DESCRIPTION
mvisonneau/generic-app	0.0.1        	0.0.0      	Generic Application Chart
```
