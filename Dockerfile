FROM golang:alpine3.15 as builder

WORKDIR /usr/app

COPY . .

RUN go mod init main && \
  go build

FROM scratch
WORKDIR /
COPY --from=builder /usr/app/main .
CMD ["/main"]