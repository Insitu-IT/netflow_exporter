FROM golang

ADD main.go /go/main.go

RUN cd /go && go get -d && go build

CMD ./go -netflow.listen-address :2066 -netflow.sample-expiry 1h -web.listen-address :6666


