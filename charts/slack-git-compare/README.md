# slack-git-compare

![Version: 0.0.10](https://img.shields.io/badge/Version-0.0.10-informational?style=flat-square) ![AppVersion: v0.1.0](https://img.shields.io/badge/AppVersion-v0.1.0-informational?style=flat-square)

Compare git references within Slack

**Homepage:** <https://github.com/mvisonneau/slack-git-compare>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mvisonneau | <maxime.visonneau@gmail.com> |  |

## Source Code

* <https://github.com/mvisonneau/helm-charts/tree/main/charts/slack-git-compare>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity for pod assignment # ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity |
| annotations | object | `{}` | additional annotations for the service |
| args | list | `[]` | arguments for the exporter binary |
| config | object | `{"cache":{},"log":{"format":"json","level":"info"},"providers":[],"slack":{"signing-secret":"","token":""},"users":[]}` | configuration variables of the app |
| envVariables | list | `[{"name":"SGC_CONFIG","value":"/etc/config.yml"}]` | environment variables for the container |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"mvisonneau/slack-git-compare"` | image pullPolicy |
| ingress.annotations | string | `nil` | additional annotations for the ingress resource |
| ingress.enabled | bool | `false` | deploy a ingress to access the exporter pod(s) /webhook endpoint |
| ingress.hosts | list | `["sgc.example.com"]` | ingress hosts |
| ingress.path | string | `"/"` | path to point the root of the ingress |
| ingress.pathType | string | `"Prefix"` | pathType of the ingress |
| ingress.service.port.name | string | `"http"` | service port name for the ingress |
| ingress.tls | list | `[{"hosts":["sgc.example.com"]}]` | ingress tls hosts config |
| labels | object | `{}` | additional labels for the service |
| livenessProbe.httpGet.path | string | `"/health/live"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| nodeSelector | object | `{}` | node selector for pod assignment # ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | additional annotations for the pods |
| podLabels | object | `{}` | additional labels for the pods |
| rbac | object | `{"clusterRole":"","enabled":false,"serviceAccount":{"name":""}}` | If your kubernetes cluster defined the pod security policy, then you need to enable this part, and define clusterRole based on your situation. |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/health/ready"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicas | int | `1` | amount of desired pod(s) replica(s) |
| resources | object | `{}` | resources to allocate to the pods |
| securityContext | string | `nil` | security context to apply to the pods # ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| strategy | object | `{"type":"RollingUpdate"}` | deployment strategy type |
| tolerations | list | `[]` | tolerations for pod assignment # ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |

