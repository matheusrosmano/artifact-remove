FROM golang:alpine3.16

WORKDIR /app

COPY src .

ENV GOPATH=/app

RUN go mod init v1

ENTRYPOINT [ "go","run","/app/main.go" ]