FROM golang:alpine AS builder

WORKDIR /hello-world

RUN go mod init hello-world && \
	touch main.go && \
	echo "package main" >> main.go && \
	echo "import \"fmt\"" >> main.go && \
	echo "func main() { fmt.Println(\"Full Cycle Rocks!!\") }" >> main.go && \
	go build main.go

FROM scratch

WORKDIR /hello-world

COPY --from=builder /hello-world/main .

CMD [ "./main" ]
