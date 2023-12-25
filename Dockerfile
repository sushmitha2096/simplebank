# creating multi stage build to reduce image size
# Build stage
FROM golang:1.21.5-alpine3.19 AS builder
WORKDIR /app
COPY . .
# -o is output. outputing value to main
RUN go build -o main main.go 

# Run stage
FROM alpine:3.19
WORKDIR /app
COPY --from=builder app/main .
# Earlier we copied only binary file which are executable so config file not included in that
COPY app.env .

EXPOSE 8080
CMD ["/app/main"]
