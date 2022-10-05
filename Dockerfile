FROM golang:alpine3.16

WORKDIR /app

COPY src .

RUN go mod tidy

ENTRYPOINT [ "go","run","/app/main.go" ]