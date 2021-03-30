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
Create the name of the service account
*/}}
{{- define "app.serviceAccountName" -}}
{{- if .Values.rbac.enabled -}}
    {{ default (include "app.fullname" .) .Values.rbac.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account
*/}}
{{- define "sanitizedConfig" -}}
{{- if eq (len .Values.config.providers) 0 -}}
{{- fail "need at least 1 provider to be configured" -}}
{{- end -}}
providers:
{{- range .Values.config.providers }}
{{- if eq (len .owners) 0 -}}
{{- fail "need at least 1 owner to be configured" -}}
{{- end }}
  - type: {{ required "provider type must be defined" .type }}
    url: {{ .url | default "" }}
    owners: {{ toYaml .owners | nindent 6 }}
{{- end }}
cache: {{ toYaml .Values.config.cache | nindent 2 }}
log: {{ toYaml .Values.config.log | nindent 2 }}
users: {{ toYaml .Values.config.users | nindent 2 }}
{{- end -}}
