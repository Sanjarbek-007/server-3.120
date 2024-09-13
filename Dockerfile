FROM golang:1.23.1 as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o myapp

FROM debian:bookworm-slim 

WORKDIR /root/

COPY --from=builder /app/myapp .

CMD ["./myapp"]
