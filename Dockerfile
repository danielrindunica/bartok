# syntax=docker/dockerfile:1
ARG GO_VERSION=1.23
ARG ALPINE_VERSION=3.20
ARG ALPINE_SHA256=d0b31558e6b3e4cc59f6011d79905835108c919143ebecc58f35965bf79948f4
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION}@sha256:${ALPINE_SHA256}

RUN apk update && \
    apk add --no-cache \
    git \
    wget

WORKDIR /app

COPY go.mod go.sum .air.toml ./

RUN go install github.com/cosmtrek/air@v1.27.10
RUN go mod download github.com/slack-go/slack@latest
RUN go mod download

EXPOSE 8000

HEALTHCHECK  --interval=5m --timeout=3s --start-period=2m \
    CMD wget --no-verbose --tries=3 --spider http://localhost:8000/status/ || exit 1

CMD ["air"]
