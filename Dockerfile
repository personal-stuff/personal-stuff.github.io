FROM golang:1.9-alpine

# git is a dependency for gometalinter
RUN apk add --no-cache git

# Install gometalinter.
RUN go get -u github.com/alecthomas/gometalinter
RUN gometalinter --install

RUN mkdir -p ~/go/src/github.com/saltside/server

ADD . ~/go/src/github.com/saltside/server/
WORKDIR ~/go/src/github.com/saltside/server/

# Add binaries you want to compile here.
RUN go build -o ~/go/bin/server .

EXPOSE 8080

CMD ["true"]
