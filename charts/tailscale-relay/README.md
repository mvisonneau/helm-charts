# tailscale-relay

![Version: 0.2.6](https://img.shields.io/badge/Version-0.2.6-informational?style=flat-square) ![AppVersion: v1.58.2](https://img.shields.io/badge/AppVersion-v1.58.2-informational?style=flat-square)

Deploy a tailscale relay on top of kubernetes

**Homepage:** <https://github.com/mvisonneau/tailscale-relay-over-k8s>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mvisonneau | <maxime.visonneau@gmail.com> |  |

## Source Code

* <https://github.com/mvisonneau/helm-charts/tree/main/charts/tailscale-relay-over-k8s>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` | Additional annotations to add to all resources  |
| config.authKey | string | `"foo"` |  |
| config.variables | object | `{}` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| hostAliases | object | `{}` | allows you to configure custom host aliases |
| hostNetwork | bool | `false` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"docker.io/mvisonneau/tailscale"` |  |
| labels | object | `{}` | Additional labels to add to all resources  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | Additional annotations for the pods |
| podLabels | object | `{}` | Additional labels for the pods |
| rbac | object | `{"create":true,"serviceAccount":{"name":"tailscale-relay"},"stateSecretName":"tailscale-relay-state"}` | If your kubernetes cluster defined the pod security policy, then you need to enable this part, and define clusterRole based on your situation. |
| rbac.serviceAccount | object | `{"name":"tailscale-relay"}` | default name of serviceAccount is "default" if you don't define the name by yourself |
| rbac.stateSecretName | string | `"tailscale-relay-state"` | name of the secret in which tailscaled will store its state |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| tolerations | list | `[]` |  |

