# approuvez

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![AppVersion: v0.1.0](https://img.shields.io/badge/AppVersion-v0.1.0-informational?style=flat-square)

CLI helper to obtain live confirmation from people over Slack

**Homepage:** <https://github.com/mvisonneau/approuvez>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mvisonneau | <maxime.visonneau@gmail.com> |  |

## Source Code

* <https://github.com/mvisonneau/helm-charts/tree/main/charts/approuvez>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity for pod assignment # ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity |
| annotations | object | `{}` | additional annotations for the service |
| args | list | `["--log-format","json","serve"]` | arguments for the command |
| envVariables | list | `[]` | environment variables for the container |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/mvisonneau/approuvez"` | image pullPolicy |
| ingress.annotations | string | `nil` | additional annotations for the ingress resource |
| ingress.enabled | bool | `false` | deploy a ingress to access the exporter pod(s) /webhook endpoint |
| ingress.hosts | list | `["approuvez.example.com"]` | ingress hosts |
| ingress.ingressClassName | object | `{}` | ingressClassName to be used instead of the deprecated annotation kubernetes.io/ingress.class |
| ingress.path | string | `"/"` | path to point the root of the ingress at |
| ingress.pathType | string | `"Prefix"` | pathType for the ingress |
| ingress.service.port.name | string | `"grpc-web"` | service port for the ingress |
| ingress.tls | list | `[{"hosts":["approuvez.example.com"],"secretName":{}}]` | ingress tls hosts config |
| labels | object | `{}` | additional labels for the service |
| livenessProbe.httpGet.path | string | `"/health/live"` |  |
| livenessProbe.httpGet.port | int | `8443` |  |
| nodeSelector | object | `{}` | node selector for pod assignment # ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | additional annotations for the pods |
| podLabels | object | `{}` | additional labels for the pods |
| rbac | object | `{"clusterRole":"","enabled":false,"serviceAccount":{"name":""}}` | If your kubernetes cluster defined the pod security policy, then you need to enable this part, and define clusterRole based on your situation. |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/health/ready"` |  |
| readinessProbe.httpGet.port | int | `8443` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicas | int | `1` | amount of desired pod(s) replica(s) |
| resources | object | `{}` | resources to allocate to the pods |
| securityContext | string | `nil` | security context to apply to the pods # ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `8443` |  |
| service.type | string | `"ClusterIP"` |  |
| strategy | object | `{"type":"RollingUpdate"}` | deployment strategy type |
| tls | object | `{"ca":null,"cert":null,"enabled":false,"key":null}` | mTLS certificates |
| tolerations | list | `[]` | tolerations for pod assignment # ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |

