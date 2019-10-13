
FROM golang:1.13 as builder
ADD apis /dronemap/apis
ADD go.mod /dronemap/go.mod
ADD cmd /dronemap/cmd
ADD pkg /dronemap/pkg
ADD main.go /dronemap/main.go
ADD vendor /dronemap/vendor
WORKDIR /dronemap/
RUN go build -o  dronemap main.go

FROM hub.tesdev.io/fabric/lunatainer:v0.8.3
COPY --from=builder  /dronemap/dronemap /dronemap
ENTRYPOINT ["/dronemap"]
