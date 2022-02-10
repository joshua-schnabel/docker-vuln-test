FROM ubuntu:16.04

RUN apt-get update && apt-get install curl gnutls-devel gcc bzip2 -y && apt-get clean

# wget - command line utility (manual install)
#
# https://www.cvedetails.com/cve/CVE-2014-4877/
#
RUN curl -LO ${CURL_OPTIONS} \
      http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/wget/wget-1.15.tar.gz && \
    tar zxf wget-1.15.tar.gz && \
    cd wget-1.15 && \
    ./configure --prefix=/opt/wget && \
    make && \
    make install && \
    cd .. && \
    rm -rf wget-1.15 && \
    rm *.tar.gz
