FROM centos:6

ENV PATH="/usr/local/go/bin:/go/bin:${PATH}"
ENV GOPATH="/go"

RUN yum update -y; \
  yum install -y wget git libpcap-devel gcc

RUN wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz; \
  tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz; \
  rm go1.8.3.linux-amd64.tar.gz;

RUN mkdir -p /go/src
