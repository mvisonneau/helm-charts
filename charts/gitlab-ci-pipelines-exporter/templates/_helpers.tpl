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
Common labels
*/}}
{{- define "app.labels" -}}
{{ include "app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/component: prometheus-exporter
app.kubernetes.io/part-of: {{ include "app.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "app.chart" . }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end -}}
{{- end -}}

{{/*
Common selector labels
*/}}
{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Create the name of the service account
*/}}
{{- define "exporter.serviceAccountName" -}}
{{- if .Values.rbac.enabled -}}
    {{ default (include "app.fullname" .) .Values.rbac.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Sanitized version of the config
*/}}
{{- define "sanitizedConfig" -}}
log:
  {{- if .Values.config.log }}
  level: {{ default "info" .Values.config.log.level }}
  format: {{ default "json" .Values.config.log.format }}
  {{- else }}
  format: json
  {{- end }}

{{- with .Values.config.server }}
server:
  {{- with .listen_address }}
  listen_address: {{ . }}
  {{- end }}
  {{- with .enable_pprof }}
  enable_pprof: {{ . }}
  {{- end }}
  {{- with .metrics }}
  metrics: {{ toYaml . | nindent 4 }}
  {{- end }}
  {{- with .webhook.enabled }}
  webhook:
    enabled: true
  {{- end }}

{{- end }}
{{- with .Values.config.gitlab }}
gitlab:
  url: {{ default "https://gitlab.com" .url }}
  {{- with .health_url }}
  health_url: {{ . }}
  {{- end }}
  enable_health_check: {{ .enable_health_check }}
  enable_tls_verify: {{ .enable_tls_verify }}
  {{- with .maximum_requests_per_second }}
  maximum_requests_per_second: {{ . }}
  {{- end }}

{{- end }}
{{- with .Values.config.pull }}
pull: {{ toYaml . | nindent 2 }}

{{- end }}
{{- with .Values.config.garbage_collect }}
garbage_collect: {{ toYaml . | nindent 2 }}

{{- end }}
{{- with .Values.config.project_defaults }}
project_defaults: {{ toYaml . | nindent 2 }}

{{- end }}
{{- with .Values.config.projects }}
projects: {{ toYaml . | nindent 2 }}

{{- end }}
{{- with .Values.config.wildcards }}
wildcards: {{ toYaml . | nindent 2 }}

{{- end }}
{{- end -}}
