FROM golang:alpine3.16

WORKDIR /app

COPY src .

ENTRYPOINT [ "go","run","/app/main.go" ]