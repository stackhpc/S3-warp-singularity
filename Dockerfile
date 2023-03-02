# syntax=docker/dockerfile:1
FROM golang:1.20-alpine
RUN go install github.com/stackhpc/warp@latest
ENTRYPOINT ["/go/bin/warp"]