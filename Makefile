
.PHONY:  build dev minikube-mac minikube

## Code Gen
gen: gen-go
gen-go:
		protoc -I apis/ -I protos/github.com/googleapis/googleapis ./apis/dronemap.proto --go_out=plugins=grpc:apis --gorm_out=apis \
		--grpc-gateway_out=logtostderr=true:apis  --swagger_out=logtostderr=true:apis

## Dev
dev:
		@skaffold dev



## minikube - generally works for folks
minikube:
		@minikube start --memory=8192 --cpus=4 --disk-size=100g

## Mac's sholuld use hyperkit if possible.
minikube-mac:
		@minikube start --memory=8192 --cpus=4 --vm-driver=hyperkit --disk-size=100g

## Tiller
tiller:
		@kubectl apply -f tiller.yaml
		@helm init --service-account=tiller --upgrade
