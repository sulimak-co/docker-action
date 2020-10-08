FROM alpine:latest

LABEL "name"="Sulimak-co Docker Action"
LABEL "maintainer"="Alexandr Kizilow <alexandr.kizilow@gmail.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Sulimak-co Docker Action"
LABEL "com.github.actions.description"="GitHub Actions for build and publish Docker Image"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git bash

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]