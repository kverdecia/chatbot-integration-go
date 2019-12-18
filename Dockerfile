FROM golang:alpine

RUN apk update
RUN apk add alpine-sdk
RUN apk add git
RUN go get -x -d github.com/stamblerre/gocode 2>&1
RUN go build -o gocode-gomod github.com/stamblerre/gocode
RUN mv gocode-gomod $GOPATH/bin/
RUN go get -u -v \
        github.com/golang/dep/cmd/dep \
        golang.org/x/tools/cmd/gopls \
        github.com/mdempsky/gocode \
        github.com/uudashr/gopkgs/cmd/gopkgs \
        github.com/ramya-rao-a/go-outline \
        github.com/acroca/go-symbols \
        golang.org/x/tools/cmd/guru \
        golang.org/x/tools/cmd/gorename \
        github.com/go-delve/delve/cmd/dlv \
        github.com/stamblerre/gocode \
        github.com/rogpeppe/godef \
        golang.org/x/tools/cmd/goimports \
        golang.org/x/lint/golint 2>&1

EXPOSE 8000
