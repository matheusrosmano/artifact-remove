FROM golang:alpine3.16

WORKDIR /usr/src/app

COPY src .

ENTRYPOINT [ "go","run","/usr/src/app/main.go" ]