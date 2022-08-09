FROM debian:latest AS gobuilder
RUN apt update && apt -y upgrade && apt install -y git golang libpcap-dev
ENV GOPATH /go
WORKDIR /go/src/ppamo
RUN git clone https://github.com/dreddsa5dies/goHackTools.git ht && cd ht && \
	go get github.com/briandowns/spinner github.com/jackdanger/collectlinks github.com/flopp/go-staticmaps \
	golang.org/x/crypto/ssh golang.org/x/crypto/ssh/agent rsc.io/pdf && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_metaDataPdf projects/07_metaDataPdf/scanMetaDataPDF.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_sshCrack projects/12_sshCrack/crackSsh.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_sshSwarm projects/13_sshSwarm/swarm.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_tcpProxy projects/14_TCPProxy/proxy.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_sshTunnel projects/15_sshTunnel/tunel.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_shell projects/16_shell/shell.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_forensicImage projects/17_forensicImage/forensicImage.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_getGeoTagPhoto projects/19_getGeoTagPhoto/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_rsaapp projects/21_RSAapp/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_cipherOfCaesar projects/22_CipherOfCaesar/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_cryptographer projects/23_Cryptographer/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_calculateYouByMac projects/25_calculateYouByMac/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_getFileInfo projects/26_getFileInfo/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_readingBootSector projects/27_readingBootSector/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_webChecker projects/28_webChecker/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_steganoImgArch projects/29_steganoImgArch/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_detectSteganoImgAndExtractIt projects/30_detectSteganoImgAndExtractIt/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_lookupIP projects/31_lookupIP/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_lookupHost projects/32_lookupHost/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_getMXRec projects/33_getMXRec/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_getServName projects/34_getServName/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_csprng projects/35_CSPRNG/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_bruteHtmlForm projects/36_bruteHtmlForm/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_httpHead projects/37_httpHead/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_findHtmlComm projects/38_findHtmlComm/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_findFilesOnWebServ projects/39_findFilesOnWebServ/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_userAgent projects/40_userAgent/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_getHeader projects/41_getHeader/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_grabbing projects/42_grabbing/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_netScan projects/43_netScan/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_base64 projects/44_base64/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_findWrFiles projects/45_findWrFiles/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_fileTimestamp projects/46_fileTimestamp/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_filePerm projects/47_filePerm/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_fileOwnership projects/48_fileOwnership/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_buildPNGmap projects/49_buildPNGmap/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_extrLinkToMaltego projects/50_extrLinkToMaltego/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_extrEmailToMaltego projects/51_extrEmailToMaltego/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_findAltSites projects/52_findAltSites/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_cipherROT13 projects/53_cipherROT13/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_vigenere projects/54_Vigenere/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_bookCipher projects/55_bookCipher/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_perconscan projects/56_PerformingConcurrentScanning/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_dnsGetA projects/58_dnsGetA/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_subdomains projects/59_subdomains/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_filepathInfoSearcher projects/60_filepathInfoSearcher/main.go && \
	CGO_ENABLED=0 GOOS=linux go build -v -a -o /go/bin/go_icmpPayload projects/63_icmpPayload/client.go


FROM busybox:latest
LABEL maintainer="Pablo Mansilla Ojeda <pablo@ppamo.cl>"
LABEL version=0.1.0
LABEL description="multiple net tools over a docker's busybox image"

WORKDIR /mnt
COPY bin/* /bin/
COPY res/services /etc/
COPY res/nmap-* /usr/local/share/nmap/
COPY res/p0f.fp /
COPY --from=gobuilder /go/bin/* /bin/
