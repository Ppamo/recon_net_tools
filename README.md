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
- [wpscan](#a_wpscan)
- [grpcdump](#a_grpcdump)


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
docker run -t --rm -v $PWD:/mnt ppamo/nettools:0.1.0 sh -c "ag text"
docker run -t --rm -v $PWD/mnt ppamo/nettools:0.1.0 sh -c "ag -G .txt text"
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
docker run -t --rm --network host ppamo/nettools:0.1.0 sh -c "heartbleeder github.com:443"
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
docker run -ti --rm --network host ppamo/nettools:0.1.0 sh -c "lsciphers github.com:443"
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
docker run -ti --rm --network host ppamo/nettools:0.1.0 sh -c 'printf "GET / HTTP/1.0\r\n\r\n" | nc google.com 80'
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
docker run -ti --rm --network host ppamo/nettools:0.1.0 sh -c "nmap -v scanme.nmap.org"
```


---

## nping: <a id='a_nping'></a>
- [homepage](https://nmap.org/nping/)

---

## objcopy: <a id='a_objcopy'></a>
- [man pages](https://man7.org/linux/man-pages/man1/objcopy.1.html)


---

## objdump: <a id='a_objdump'></a>
- [man pages](https://man7.org/linux/man-pages/man1/objdump.1.html)

---

## readelf: <a id='a_readelf'></a>
- [man pages](https://sourceware.org/binutils/docs/binutils/readelf.html)

---

## size: <a id='a_size'></a>
- [man pages](https://linux.die.net/man/1/size)

---

## socat: <a id='a_socat'></a>
- [man pages](https://linux.die.net/man/1/socat)

---

## strings: <a id='a_strings'></a>
- [man pages](https://linux.die.net/man/1/strings)

---

## wpscan: <a id='a_wpscan'></a>
- [homepage](https://github.com/krishpranav/wpscan)

---

## grpcdump: <a id='a_grpcdump'></a>
- [homepage](https://github.com/rmedvedev/grpcdump)

---
