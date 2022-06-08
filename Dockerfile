FROM golang:1.11-alpine

LABEL maintainer='pascal.madlmayr@gmail.com'

WORKDIR /src

COPY main.go ./

RUN echo $(ls)

RUN CGO_ENABLED=0 go build -o /usr/myappmain

EXPOSE 8888

CMD ["/usr/myappmain"]

FROM alpine:3.7

RUN apk add curl \
    && curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin \
    && trivy filesystem --exit-code 1 --no-progress /