# syntax=docker/dockerfile:1
ARG ALPINE_VERSION=3.20
ARG ALPINE_SHA256=0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5
FROM alpine:${ALPINE_VERSION}@sha256:${ALPINE_SHA256}

RUN apk update &&  \
    apk add --no-cache \
    go \
    bash \
    build-base \
    curl \
    git \
    sudo \
    openssh-client \
    zsh \
    docker-cli

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN <<EOF
go install golang.org/x/tools/gopls@latest
go install github.com/stamblerre/gocode@latest
go install github.com/mdempsky/gocode@latest
go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
go install github.com/ramya-rao-a/go-outline@latest
go install github.com/acroca/go-symbols@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/rogpeppe/godef@latest
go install golang.org/x/lint/golint@latest
go mod download github.com/slack-go/slack@latest
EOF
