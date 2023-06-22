FROM golang:latest

RUN mkdir /trezord-go
WORKDIR /trezord-go
COPY ./scripts/run_in_docker.sh /trezord-go

RUN apt-get update
RUN apt-get install -y redir

RUN go get github.com/stops-top/trezord
RUN go build github.com/stops-top/trezord

ENTRYPOINT '/trezord-go/run_in_docker.sh'
EXPOSE 11325
