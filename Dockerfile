FROM ubuntu:14.04
MAINTAINER Sunjin Lee <styner32@gmail.com>

RUN apt-get update && apt-get install -y curl git sox libsox-fmt-mp3

ENV GOPATH /root/go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/root/go/bin

RUN curl -s https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz | tar -C /usr/local -xz && sed -i '1s/^/PATH=$PATH:\/usr\/local\/bin:\/root\/go\/bin:\n/' /root/.bashrc && sed -i '1s/^/GOROOT=\/usr\/local\/go\n/' /root/.bashrc && sed -i '1s/^/GOROOT=\/root\/go\n/' /root/.bashrc && mkdir -p /root/go && env >> /etc/environment && apt-get update && apt-get install -y mercurial

RUN go get github.com/styner32/go-wave-to-json

ADD main.go /main.go
RUN go build /main.go
RUN mv main /usr/local/go/bin/

ADD source.mp3 /source.mp3

ADD execute.sh /usr/local/bin/execute.sh
ENTRYPOINT ["/usr/local/bin/execute.sh"]