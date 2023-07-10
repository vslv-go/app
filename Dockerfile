FROM golang:1.20.5-alpine3.18 as builder

COPY . /work
WORKDIR /work

RUN go build -o /tmp/app main.go

FROM alpine:3.18

COPY --from=builder /tmp/app /usr/bin/app

EXPOSE 8000
ENTRYPOINT ["/usr/bin/app"]
