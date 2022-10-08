FROM golang:alpine3.16

WORKDIR /usr/src/app

COPY src .

RUN go mod tidy
RUN go build -o main

ENTRYPOINT [ "./main" ]