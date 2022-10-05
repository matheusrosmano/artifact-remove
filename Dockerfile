FROM golang:alpine3.16

WORKDIR /app

COPY src .

RUN go env -w GO111MODULE=off
ENV GOPATH=$(pwd)

ENTRYPOINT [ "go","run","/app/main.go" ]