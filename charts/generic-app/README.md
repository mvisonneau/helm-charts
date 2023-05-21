# generic-app

![Version: 0.0.16](https://img.shields.io/badge/Version-0.0.16-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

Generic Application Chart

**Homepage:** <https://github.com/mvisonneau/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mvisonneau | <maxime.visonneau@gmail.com> |  |

## Source Code

* <https://github.com/mvisonneau/helm-charts/tree/main/charts/generic-app>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMaps | object | `{}` |  |
| datadog.enabled | bool | `false` |  |
| global.datadog.enabled | bool | `false` | inject datadog related labels/env variables |
| horizontalPodAutoscaler.enabled | bool | `false` |  |
| horizontalPodAutoscaler.maxReplicas | int | `2` |  |
| horizontalPodAutoscaler.minReplicas | int | `1` |  |
| horizontalPodAutoscaler.targetAverageCPUUtilization | int | `60` |  |
| imageCredentials | object | `{}` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/force-ssl-redirect" | string | `"true"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.service.port.name | string | `"http"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `nil` | name of the chart/release to override 'generic-app' with |
| podDisruptionBudget.enabled | bool | `true` |  |
| podDisruptionBudget.minAvailable | int | `1` |  |
| pods.additionalContainers | list | `[]` |  |
| pods.affinity.antiAffinity.enabled | bool | `false` |  |
| pods.affinity.antiAffinity.topologyKey | string | `"kubernetes.io/hostname"` |  |
| pods.affinity.antiAffinity.type | string | `"hard"` |  |
| pods.affinity.rules | object | `{}` |  |
| pods.annotations | object | `{}` |  |
| pods.args | list | `[]` |  |
| pods.command | list | `[]` |  |
| pods.controller | string | `"deployment"` | controller used to schedule pods Can either be 'deployment', 'statefulset' or 'daemonset' |
| pods.dnsPolicy | string | `"ClusterFirst"` |  |
| pods.env | list | `[]` |  |
| pods.envFrom | list | `[]` |  |
| pods.image.name | string | `nil` | image repository/name |
| pods.image.pullCredentials | object | `{}` | Automatically create a secret with the credentials and use it Cannot be used in conjunction of image.pullSecrets |
| pods.image.pullPolicy | string | `"IfNotPresent"` | image pullPolicy |
| pods.image.pullSecrets | list | `[]` | Optional array of imagePullSecrets containing private registry credentials Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| pods.image.tag | string | `nil` | image tag |
| pods.initContainers | list | `[]` |  |
| pods.labels | object | `{}` |  |
| pods.livenessProbe | object | `{}` |  |
| pods.nodeSelector | object | `{}` |  |
| pods.podAnnotations | object | `{}` |  |
| pods.podLabels | object | `{}` |  |
| pods.ports[0].containerPort | int | `8080` |  |
| pods.readinessProbe | object | `{}` |  |
| pods.replicas | string | `nil` | amount of desired pod(s) replica(s) Ref: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#replicas |
| pods.resources | object | `{}` |  |
| pods.revisionHistoryLimit | int | `3` |  |
| pods.securityContext | object | `{}` |  |
| pods.strategy | object | `{}` |  |
| pods.tolerations | list | `[]` |  |
| pods.volumeMounts | list | `[]` |  |
| pods.volumes | list | `[]` |  |
| secrets | object | `{}` |  |
| service.enabled | bool | `true` |  |
| service.ports[0].name | string | `"http"` |  |
| service.ports[0].port | int | `80` |  |
| service.ports[0].protocol | string | `"TCP"` |  |
| service.ports[0].targetPort | int | `8080` |  |
| serviceAccount.create | bool | `false` | create a service account and associate it with the pods |
| serviceAccount.name | string | `"default"` | name of the service account to use (and potentially create) |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.path | string | `"/metrics"` |  |
| serviceMonitor.port | string | `"metrics"` |  |

