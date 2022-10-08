FROM golang:alpine3.16

WORKDIR /usr/src/

COPY src .

RUN go mod tidy
RUN go build -o main

CMD ["./main"]