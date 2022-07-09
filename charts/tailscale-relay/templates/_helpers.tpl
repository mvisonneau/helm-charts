{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate basic labels
*/}}
{{- define "app.labels" }}
helm.sh/chart: {{ include "app.chart" . }}
app.kubernetes.io/name: {{ include "app.chart" . }}
app.kubernetes.io/component: tailscale
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" }}
app.kubernetes.io/name: {{ include "app.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Generate basic annotations
*/}}
{{- define "app.annotations" }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}


{{- define "app.serviceAccountName" -}}
    {{ default (include "app.fullname" .) .Values.rbac.serviceAccountName }}
{{- end -}}

{{- define "app.containerName" -}}
    {{- if or .Values.sidecar.enabled .Values.userspaceSidecar.enabled -}}
        "ts-sidecar"
    {{- else -}}
        "tailscale"
    {{- end -}}
{{- end -}}

{{- define "app.podName" -}}
    {{- if or .Values.sidecar.enabled .Values.userspaceSidecar.enabled -}}
        "nginx"
    {{- else if .Values.subnet.enabled -}}
        "subnet-router"
    {{- else -}}
        "proxy"
    {{- end -}}
{{- end -}}

{{- define "app.mode" -}}
    {{- if and .sidecar.enabled  (not .userspaceSidecar.enabled)  (not .proxy.enabled) (not .subnet.enabled)}}
        sidecar
    {{- else if and (not .sidecar.enabled) .userspaceSidecar.enabled  (not .proxy.enabled) (not .subnet.enabled)}}
        userspaceSidecar
    {{- else if and (not .sidecar.enabled)  (not .userspaceSidecar.enabled) .proxy.enabled (not .subnet.enabled)}}
        proxy
    {{- else if and (not .sidecar.enabled)  (not .userspaceSidecar.enabled)  (not .proxy.enabled) .subnet.enabled}}
        subnet
    {{- end }}
{{- end -}}