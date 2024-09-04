FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app /app

CMD ["./main"]


