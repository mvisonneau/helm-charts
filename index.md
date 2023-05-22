[https://github.com/mvisonneau/helm-charts](https://github.com/mvisonneau/helm-charts)

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
