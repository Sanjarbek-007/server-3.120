FROM golang:1.23.1 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o myapp

FROM debian:bullseye-slim
WORKDIR /root/
COPY --from=builder /app/myapp .
CMD ["./myapp"]
