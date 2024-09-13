FROM golang:1.21 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o main .

FROM debian:bullseye-slim

WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 8082

CMD ["./main"]
