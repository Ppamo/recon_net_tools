FROM debian:latest AS gobuilder
RUN apt update && apt -y upgrade && apt install -y git golang
ENV GOPATH /go
WORKDIR /go/src/ppamo
RUN git clone https://github.com/krishpranav/wpscan.git wpscan && cd wpscan && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/wpscan . && cd ..
RUN git clone https://github.com/rmedvedev/grpcdump.git grpcdump && cd grpcdump && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/grpcdump cmd/grpcdump/main.go && cd ..


FROM busybox:latest
LABEL maintainer="Pablo Mansilla Ojeda <pablo@ppamo.cl>"
LABEL version=0.1.0
LABEL description="multiple net tools over a docker's busybox image"

COPY bin/* /bin/
COPY res/services /etc/
COPY res/nmap-* /usr/local/share/nmap/
COPY res/p0f.fp /
COPY --from=gobuilder /go/bin/* /bin/
