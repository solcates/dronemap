package server

import (
	"context"
	dronemap "github.com/solcates/dronemap/apis"
)

type Server struct {
}

func NewServer() *Server {
	return &Server{}
}

func (s *Server) Echo(ctx context.Context, req *dronemap.EchoRequest) (resp *dronemap.EchoResponse, err error) {

	return
}
