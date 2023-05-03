FROM golang:alpine AS builder

WORKDIR /hello-world

RUN go mod init hello-world
COPY main.go .
RUN	go build main.go

FROM scratch

WORKDIR /hello-world

COPY --from=builder /hello-world/main .

CMD [ "./main" ]
