# gitlab-ci-pipelines-exporter

![Version: 0.2.9](https://img.shields.io/badge/Version-0.2.9-informational?style=flat-square) ![AppVersion: v0.5.2](https://img.shields.io/badge/AppVersion-v0.5.2-informational?style=flat-square)

Prometheus / OpenMetrics exporter for GitLab CI pipelines insights

**Homepage:** <https://github.com/mvisonneau/gitlab-ci-pipelines-exporter>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mvisonneau | maxime.visonneau@gmail.com |  |

## Source Code

* <https://github.com/mvisonneau/helm-charts/tree/main/charts/gitlab-ci-pipelines-exporter>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 14.6.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity for pod assignment |
| annotations | object | `{}` | additional annotations for the service |
| args | list | `["--config","/etc/config.yml"]` | arguments for the exporter binary |
| command | list | `["gitlab-ci-pipelines-exporter","run"]` | command for the exporter binary |
| config | object | `{}` | configuration of the exporter |
| envVariables | list | `[{"name":"GCPE_INTERNAL_MONITORING_LISTENER_ADDRESS","value":"tcp://127.0.0.1:8082"}]` | environment variables for the container |
| gitlabSecret | string | `""` | name of a `Secret` containing the GitLab token in the `gitlabToken` field (required unless `config.gitlab.token` is specified) |
| hostAliases | list | `[]` |  |
| image.pullCredentials | object | `{}` | Automatically create a secret with the credentials and use it Cannot be used in conjunction of image.pullSecrets |
| image.pullPolicy | string | `"IfNotPresent"` | image pullPolicy |
| image.pullSecrets | list | `[]` | Optional array of imagePullSecrets containing private registry credentials Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| image.repository | string | `"mvisonneau/gitlab-ci-pipelines-exporter"` | image repository |
| ingress.annotations | string | `nil` | additional annotations for the ingress resource |
| ingress.enabled | bool | `false` | deploy a ingress to access the exporter pod(s) /webhook endpoint |
| ingress.hosts | list | `["gcpe.example.com"]` | ingress hosts |
| ingress.path | string | `"/webhook"` | path on the exporter to point the root of the ingress |
| ingress.pathType | string | `"Prefix"` | pathType for the ingress |
| ingress.service.port.name | string | `"http"` | service port for the ingress |
| ingress.tls | list | `[{"hosts":["gcpe.example.com"]}]` | ingress tls hosts config |
| labels | object | `{}` | additional labels for the service |
| livenessProbe.httpGet.path | string | `"/health/live"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| nodeSelector | object | `{}` | node selector for pod assignment |
| podAnnotations | object | `{}` | additional annotations for the pods |
| podLabels | object | `{}` | additional labels for the pods |
| rbac | object | `{"clusterRole":"","enabled":false,"serviceAccount":{"name":""}}` | If your kubernetes cluster defined the pod security policy, then you need to enable this part, and define clusterRole based on your situation. |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/health/ready"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| redis.architecture | string | `"standalone"` | run in standalone or clustermode |
| redis.auth.enabled | bool | `false` | enable authentication |
| redis.enabled | bool | `true` | deploy a redis statefulset |
| redis.master.persistence.enabled | bool | `false` | persist data |
| redis.metrics.enabled | bool | `false` | enable /metrics endpoint of the redis pods |
| redis.metrics.serviceMonitor.enabled | bool | `false` | deploy a serviceMonitor resource for the redis pods |
| replicas | int | `1` | amount of desired pod(s) replica(s) |
| resources | object | `{}` | resources to allocate to the pods |
| securityContext | string | `nil` | security context to apply to the pods |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.annotations | object | `{}` | additional annotations for the service monitor |
| serviceMonitor.enabled | bool | `false` | deploy a serviceMonitor resource |
| serviceMonitor.labels | object | `{}` | additional labels for the service monitor |
| serviceMonitor.scrapeInterval | string | `"10s"` | prometheus probes interval |
| strategy | object | `{"type":"RollingUpdate"}` | deployment strategy type |
| tolerations | list | `[]` | tolerations for pod assignment |
| webhookSecret | string | `""` | name of a `Secret` containing the webhook token in the `webhookToken` field (required unless `config.server.webhook.secret_token` is specified) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
