FROM golang:1.11-alpine

LABEL maintainer='pascal.madlmayr@gmail.com'

WORKDIR /src

COPY *.go go.* ./

RUN CGO_ENABLED=0 go build -o /usr/myappmain

EXPOSE 8010

CMD ["/usr/myappmain"]