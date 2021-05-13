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
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Datadog service name
*/}}
{{- define "datadog.service" -}}
{{- coalesce .Values.datadog.service .Values.global.datadog.service (include "app.name" .) -}}
{{- end -}}

{{/*
Datadog app version
*/}}
{{- define "datadog.version" -}}
{{- coalesce .Values.datadog.version .Values.global.datadog.version (printf "%s-%d" .Chart.AppVersion .Release.Revision) -}}
{{- end -}}

{{/*
Datadog env
*/}}
{{- define "datadog.env" -}}
{{- coalesce .Values.datadog.env .Values.global.datadog.env "unknown" -}}
{{- end -}}

{{/*
Pods Labels
*/}}
{{- define "pods.labels" -}}
{{- if or .Values.datadog.enabled .Values.global.datadog.enabled -}}
{{- $ddEnv := dict "tags.datadoghq.com/env" (include "datadog.env" .) -}}
{{- $ddService := dict "tags.datadoghq.com/service" (include "datadog.service" .) -}}
{{- $ddVersion := dict "tags.datadoghq.com/version" (include "datadog.version" .) -}}
{{- deepCopy .Values.pods.labels | merge $ddEnv $ddService $ddVersion | toYaml -}}
{{- else -}}
{{- if .Values.pods.labels -}}
{{- .Values.pods.labels | toYaml -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Pods template Labels
*/}}
{{- define "pods.podLabels" -}}
{{- if or .Values.datadog.enabled .Values.global.datadog.enabled  -}}
{{- $ddEnv := dict "tags.datadoghq.com/env" (include "datadog.env" .) -}}
{{- $ddService := dict "tags.datadoghq.com/service" (include "datadog.service" .) -}}
{{- $ddVersion := dict "tags.datadoghq.com/version" (include "datadog.version" .) -}}
{{- deepCopy .Values.pods.labels | merge $ddEnv $ddService $ddVersion | toYaml -}}
{{- else -}}
{{- if .Values.pods.podLabels -}}
{{- .Values.pods.podLabels | toYaml -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Pods Env variables
*/}}
{{- define "pods.env" -}}
{{- if or .Values.datadog.enabled .Values.global.datadog.enabled  -}}
{{- $ddAgentHost := dict "name" "DD_AGENT_HOST" "valueFrom" (dict "fieldRef" (dict "fieldPath" "status.hostIP" )) -}}
{{- $ddEnv := dict "name" "DD_ENV" "valueFrom" (dict "fieldRef" (dict "fieldPath" "metadata.labels['tags.datadoghq.com/env']" )) -}}
{{- $ddService := dict "name" "DD_SERVICE" "valueFrom" (dict "fieldRef" (dict "fieldPath" "metadata.labels['tags.datadoghq.com/service']" )) -}}
{{- $ddVersion := dict "name" "DD_VERSION" "valueFrom" (dict "fieldRef" (dict "fieldPath" "metadata.labels['tags.datadoghq.com/version']" )) -}}
{{- concat .Values.pods.env (list $ddAgentHost $ddEnv $ddService $ddVersion) | toYaml -}}
{{- else -}}
{{- if .Values.pods.env -}}
{{- .Values.pods.env | toYaml -}}
{{- end -}}
{{- end -}}
{{- end -}}
