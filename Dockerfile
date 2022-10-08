FROM golang:alpine3.16 as builder

WORKDIR /app

COPY src .

RUN go mod tidy
RUN go build -o app.golang

FROM alpine:latest

COPY --from=builder /app/app.golang /usr/bin

ENTRYPOINT [ "app.golang" ]