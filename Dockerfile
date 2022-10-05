FROM golang:alpine3.16

WORKDIR /app

COPY src .

ENV GOPATH=/app

ENTRYPOINT [ "go","run","/app/main.go" ]