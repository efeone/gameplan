# syntax=docker/dockerfile:1.3

ARG FRAPPE_VERSION=v14.11.1
FROM frappe/frappe-worker:${FRAPPE_VERSION}

USER root

ARG APP_NAME
COPY . ../apps/${APP_NAME}

RUN --mount=type=cache,target=/root/.cache/pip \
    install-app ${APP_NAME}

USER frappe
