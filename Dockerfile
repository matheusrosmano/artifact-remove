FROM golang:alpine3.16

WORKDIR /app

COPY src .

RUN go env -u GOPATH=/app

ENTRYPOINT [ "go","run","/app/main.go" ]