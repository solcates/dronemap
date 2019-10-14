package server

import (
	"context"
	dronemap "github.com/solcates/dronemap/apis"
	"time"
	"gobot.io/x/gobot"
	"gobot.io/x/gobot/platforms/dji/tello"
)

type Server struct {
}

func NewServer() *Server {
	return &Server{}
}

func (s *Server) Echo(ctx context.Context, req *dronemap.EchoRequest) (resp *dronemap.EchoResponse, err error) {
	drone := tello.NewDriver("8888")

	work := func() {
		drone.TakeOff()

		gobot.After(5*time.Second, func() {
			drone.Land()
		})
	}

	robot := gobot.NewRobot("tello",
		[]gobot.Connection{},
		[]gobot.Device{drone},
		work,
	)

	robot.Start()
	return
}
