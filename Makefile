  
.PHONY: default
default: build

all: clean build test

version := "0.1.0"

build:
	mkdir -p bin

test: build
	go test -short -coverprofile=bin/cov.out `go list ./... | grep -v vendor/`
	go tool cover -func=bin/cov.out

clean:
	rm -rf ./bin

