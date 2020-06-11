FROM golang:1.13-buster

RUN go get -u github.com/raintank/fakemetrics \
 && install /go/bin/fakemetrics /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/fakemetrics"]
CMD ["backfill", "--carbon-addr", "go-carbon:2003", "--mpo", "10000", "--offset", "1s"]
