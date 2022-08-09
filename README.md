# Recon Net Tools

### Multiple net tools over a docker's busybox image

The main idea is to create a set of tools to be easily copied and started on a limited/small machine.


---

### List of tools:
- [ag](#a_ag)
- [heartbleeder](#a_heartbleeder)
- [lsciphers](#a_lsciphers)
- [ncat](#a_ncat)
- [nmap](#a_nmap)
- [nping](#a_nping)
- [objcopy](#a_objcopy)
- [objdump](#a_objdump)
- [readelf](#a_readelf)
- [size](#a_size)
- [socat](#a_socat)
- [strings](#a_strings)
- [go_metaDataPdf](#a_go_metaDataPdf)
- [go_sshCrack](#a_go_sshCrack)
- [go_sshSwarm](#a_go_sshSwarm)
- [go_tcpProxy](#a_go_tcpProxy)
- [go_sshTunnel](#a_go_sshTunnel)
- [go_shell](#a_go_shell)
- [go_forensicImage](#a_go_forensicImage)
- [go_getGeoTagPhoto](#a_go_getGeoTagPhoto)
- [go_rsaapp](#a_go_rsaapp)
- [go_cipherOfCaesar](#a_go_cipherOfCaesar)
- [go_cryptographer](#a_go_cryptographer)
- [go_calculateYouByMac](#a_go_calculateYouByMac)
- [go_getFileInfo](#a_go_getFileInfo)
- [go_readingBootSector](#a_go_readingBootSector)
- [go_webChecker](#a_go_webChecker)
- [go_steganoImgArch](#a_go_steganoImgArch)
- [go_detectSteganoImgAndExtractIt](#a_go_detectSteganoImgAndExtractIt)
- [go_lookupIP](#a_go_lookupIP)
- [go_lookupHost](#a_go_lookupHost)
- [go_getMXRec](#a_go_getMXRec)
- [go_getServName](#a_go_getServName)
- [go_csprng](#a_go_csprng)
- [go_bruteHtmlForm](#a_go_bruteHtmlForm)
- [go_httpHead](#a_go_httpHead)
- [go_findHtmlComm](#a_go_findHtmlComm)
- [go_findFilesOnWebServ](#a_go_findFilesOnWebServ)
- [go_userAgent](#a_go_userAgent)
- [go_getHeader](#a_go_getHeader)
- [go_grabbing](#a_go_grabbing)
- [go_netScan](#a_go_netScan)
- [go_base64](#a_go_base64)
- [go_findWrFiles](#a_go_findWrFiles)
- [go_fileTimestamp](#a_go_fileTimestamp)
- [go_filePerm](#a_go_filePerm)
- [go_fileOwnership](#a_go_fileOwnership)
- [go_buildPNGmap](#a_go_buildPNGmap)
- [go_extrLinkToMaltego](#a_go_extrLinkToMaltego)
- [go_extrEmailToMaltego](#a_go_extrEmailToMaltego)
- [go_findAltSites](#a_go_findAltSites)
- [go_cipherROT13](#a_go_cipherROT13)
- [go_vigenere](#a_go_vigenere)
- [go_bookCipher](#a_go_bookCipher)
- [go_perconscan](#a_go_perconscan)
- [go_dnsGetA](#a_go_dnsGetA)
- [go_subdomains](#a_go_subdomains)
- [go_filepathInfoSearcher](#a_go_filepathInfoSearcher)
- [go_icmpPayload](#a_go_icmpPayload)


---

## [ag](https://geoff.greer.fm/ag/): <a id='a_ag'></a>

Is a text search tool, like grep but faster.

In the next examples we will use it to search "text" in the files in the current folder, by default recursively, then it searcht"text" in the current folder, recursivelly, only in files with ".txt" extention:

**Usage:**
```sh
ag text
ag -G .txt text
```

**Docker usage:**
```sh
docker run -t --rm -v $PWD:/mnt ppamo/nettools sh -c "ag text"
docker run -t --rm -v $PWD:/mnt ppamo/nettools sh -c "ag -G .txt text"
```


---

## [heartbleeder](https://github.com/titanous/heartbleeder): <a id='a_heartbleeder'></a>

Checks if the remote secure server is protected for CVE-2014-0160 vulnerability, also known as [Heartbleed Bug](https://heartbleed.com/).

In the next example we will check the github web server:

**Usage:**
```sh
heartbleeder github.com:443
```

**Docker usage:**
```sh
docker run -t --rm --network host ppamo/nettools sh -c "heartbleeder github.com:443"
```


---

## [lsciphers](https://github.com/rpicard/lsciphers): <a id='a_lsciphers'></a>

Lists the ciphers supported by the remote host.

The next example will list the ciphers supported by github.com secure web server:

**Usage:**
```sh
lsciphers github.com:443
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "lsciphers github.com:443"
```


---

## [ncat](https://nmap.org/ncat/): <a id='a_ncat'></a>

Is a utility which reads and writes data across networks from command line.

The next example will read the output for a web server request:

**Usage:**
```sh
printf "GET / HTTP/1.0\r\n\r\n" | nc google.com 80
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c 'printf "GET / HTTP/1.0\r\n\r\n" | nc google.com 80'
```

---

## [nmap](https://nmap.org/): <a id='a_nmap'></a>

Is the most popular network mapper for discovery and security auditing.

The next example will scan for open ports at scanme.nmap.org:

**Usage:**
```sh
nmap -v scanme.nmap.org
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "nmap -v scanme.nmap.org"
```

---

## [nping](https://nmap.org/nping/): <a id='a_nping'></a>

Is a tool for network packet generation, response analysis and response time measurement.

A representative Nping execution sending packages at two different hosts:

**Usage:**
```sh
nping -c 1 --tcp scanme.nmap.org google.com
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "nping -c 1 --tcp scanme.nmap.org google.com"
```

---

## go_dnsGetA: <a id='a_go_dnsGetA'></a>

A DNS resolver

**Usage:**
```sh
go_dnsGetA github.com
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "go_dnsGetA github.com"
```

---

## go_lookupIP: <a id='a_go_lookupIP'></a>

An IP lookup tool

**Usage:**
```sh
go_lookupIP 8.8.8.8
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "go_lookupIP 8.8.8.8"
```

---

## go_getServName: <a id='a_go_getServName'></a>

A hostname lookup tool

**Usage:**
```sh
go_getServName github.com
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "go_getServName github.com"
```

---

## go_sshCrack: <a id='a_go_sshCrack'></a>

A ssh server cracker

**Usage:**
```sh
go_sshCrack IPList userDic passDic
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "go_sshCrack IPList userDic passDic"
```

---

## go_bruteHtmlForm: <a id='a_go_bruteHtmlForm'></a>

A force brute tool for web forms

**Usage:**
```sh
go_bruteHtmlForm passwords.txt https://test.com/login admin username password
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "go_bruteHtmlForm passwords.txt https://test.com/login admin username password"
```

---

## go_fileTimestamp: <a id='a_go_fileTimestamp'></a>

A tool to reset a file's timestamp

**Usage:**
```sh
go_fileTimestamp test.txt
```

**Docker usage:**
```sh
docker run -ti --rm --network host ppamo/nettools sh -c "go_fileTimestamp test.txt"
```

