CGO_ENABLED=0
GOOS=linux
GOARCH=amd64
COMMIT=`git rev-parse --short HEAD`
APP?=docker-proxy
REPO?=ehazlett/$(APP)
TAG?=latest
export GO15VENDOREXPERIMENT=1

all: build image

add-deps:
	@godep save
	@rm -rf Godeps

build:
	@go build .

build-static:
	@go build -a -tags "netgo static_build" -installsuffix netgo .

image:
	@docker build -t $(REPO):$(TAG) .

clean:
	@rm docker-proxy

.PHONY: build build-static image clean
