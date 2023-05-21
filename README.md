# mvisonneau/helm-charts

https://github.com/mvisonneau/helm-charts

# Usage

```bash
~$ helm repo add mvisonneau https://charts.visonneau.fr/
~$ helm repo update
~$ helm search repo mvisonneau | awk '{print $1}' | tail -n +2
mvisonneau/approuvez
mvisonneau/generic-app
mvisonneau/gitlab-ci-pipelines-exporter
mvisonneau/slack-git-compare
mvisonneau/tailscale-relay
mvisonneau/unpoller
```

## Contribute

Most interesting operations are defined within the `Makefile`:

```
~$ make help
configure-deps-repos           Configure dependencies repositories
docs                           Generate charts docs
help                           Displays this help
kubeconform                    Lint the charts templated kubernetes values
lint                           Lint the charts syntax
test                           Test installing the charts
update-deps                    Update dependencies of the charts
```

As a rule of thumb when updating a chart:
 - Bump its version in **Chart.yaml**
 - Run:
   - `make docs`
   - `make lint`
   - `make kubeconform`
   - optionally: `make test`

