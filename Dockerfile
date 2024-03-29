FROM golang:1.13 as builder
ENV GOOS linux
ENV GOARCH amd64

ADD apis /dronemap/apis
ADD go.mod /dronemap/go.mod
ADD cmd /dronemap/cmd
ADD pkg /dronemap/pkg
ADD main.go /dronemap/main.go
ADD vendor /dronemap/vendor
WORKDIR /dronemap/
RUN go build -o  dronemap main.go

FROM alpine as runner
COPY --from=builder /dronemap/dronemap /dronemap
ENTRYPOINT ["/dronemap"]
